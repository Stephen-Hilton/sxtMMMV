CREATE TABLE SXTTEMP.BB_SUI_to_LST
(
  Protocol    varchar
, Txns        integer
, Users       integer 
, Amount      decimal(18,4)
, Insert_TS   timestamp
, primary key(Protocol)
) {with}