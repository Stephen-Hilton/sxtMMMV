import os 
from pathlib import Path 
from spaceandtime import SpaceAndTime, SXTTable
from pysteve import pySteve

# setup environment:
os.chdir(Path(__file__).parent)
for envfile in ['./.env', '../.env','../.keys/.env']:
    vars = {}
    if Path(envfile).exists():
        vars = pySteve.envfile_load(envfile)
        envfile = Path(envfile).resolve()
        break 
if vars == {}: 
    print('Could not find a valid .env file, please add and try again.')
    exit(1)


# behavior flags:
rebuild_table = False


# login to SXT: 
sxt = SpaceAndTime(envfile_filepath=envfile)
sxt.authenticate()


# get all files in the "sql" subfolder:
for sqlpath in sorted(list(Path(f'{os.getcwd()}/sql').iterdir())):
    if not sqlpath.is_file(): continue
    if not sqlpath.suffix == '.sql': continue
    sxt.logger.info(f'PROCESSING: {sqlpath}')

    # create table object
    tbl = SXTTable(sqlpath.stem, private_key=vars['RESOURCE_PRIVATE_KEY'], access_type=sxt.TABLE_ACCESS.PUBLIC_READ,  SpaceAndTime_parent=sxt)
    tbl.add_biscuit('admin', sxt.GRANT.ALL)
    ddlpath = Path(f'{sqlpath.parent}/{sqlpath.stem}.ddl')
    tbl.create_ddl = str(ddlpath.read_text() if ddlpath.exists() else '').replace('\n',' ')
        
    # build / rebuild if needed
    if rebuild_table and tbl.exists and tbl.create_ddl_template != '': success, response = tbl.drop()
    if not tbl.exists and tbl.create_ddl_template != '': success, response = tbl.create()

    # If table exists, continue processing
    if tbl.exists:

        # run all SQL and collect all rows:
        all_rows = []
        rpt = {'success':0, 'error':0, 'error_sql':[]}
        for sqltext in str(sqlpath.read_text()).split(';'):
            sqltext = sqltext.strip()
            if len(sqltext) >0: 
                if sxt.user.access_expired: sxt.user.reauthenticate()
                success, data = sxt.execute_query(sqltext)
                if success: 
                    all_rows.extend(data)
                    rpt['success'] +=1
                else:
                    rpt['error'] +=1
                    rpt['error_sql'].append(sqltext)
        msg = f'Completed Running SQL, Successes:{rpt["success"]}, Errors:{rpt["error"]}'
        if rpt['error']==0: 
            sxt.logger.info(msg)
        else: 
            sxt.logger.warning(msg)


        # delete all records
        success, response = tbl.delete(where='')
        if not success: break # don't refresh with partial data

        # insert all_rows into table
        success, response = tbl.insert.with_list_of_dicts(data)
        if not success:
            sxt.logger.error(f'Something went wrong with the data insert: \n{response}')


sxt.logger.info('\n\n'+'-'*40+"PROCESS COMPLETE!")

