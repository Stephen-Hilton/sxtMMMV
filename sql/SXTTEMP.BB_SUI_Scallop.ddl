CREATE TABLE SXTTEMP.BB_SUI_Scallop
(
  Event_Date  date 
, Asset       varchar
, Txns        integer
, Suppliers   integer 
, Supplied    decimal(18,4)
, Insert_TS   timestamp
, primary key(Event_Date, Asset)
) {with}