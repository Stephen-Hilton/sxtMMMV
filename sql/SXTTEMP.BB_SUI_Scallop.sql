SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS 
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'SUI' as asset,e.sender,package_id,-b.amount/1e6 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountStakeEvent' AND b.coin_type = '0x2::sui::SUI' AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS 
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'USDC' as asset,e.sender,package_id,-b.amount/1e6 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountStakeEvent'
AND b.coin_type = '0x5d4b302506645c37ff133b98c4b50a5ae14841659738d6d733d59d0d217a93bf::coin::COIN'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS 
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,
  'USDT' as asset,e.sender,package_id,-b.amount/1e6 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountStakeEvent'
AND b.coin_type = '0xc060006111016b8a020ad5b33834984a437aaa7d3c74c18e09a95d48aceab08c::coin::COIN'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'haSUI' as asset,e.sender,package_id,-b.amount/1e9 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountStakeEvent'
AND b.coin_type = '0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d::hasui::HASUI'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'vSUI' as asset,e.sender,package_id,-b.amount/1e9 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountStakeEvent'
AND b.coin_type = '0x549e8b69270defbfafd4f94e17ec44cdbdd99820b33bda2278dea3b9a32d3f55::cert::CERT'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'SUI' as asset,e.sender,package_id,-b.amount/1e6 as amount
FROM SUI.EVENTS e 
LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountUnstakeEvent'
AND b.coin_type = '0x2::sui::SUI'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'USDC' as asset,e.sender,package_id,-b.amount/1e6 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountUnstakeEvent'
AND b.coin_type = '0x5d4b302506645c37ff133b98c4b50a5ae14841659738d6d733d59d0d217a93bf::coin::COIN'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'USDT' as asset,e.sender,package_id,-b.amount/1e6 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountUnstakeEvent'
AND b.coin_type = '0xc060006111016b8a020ad5b33834984a437aaa7d3c74c18e09a95d48aceab08c::coin::COIN'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'haSUI' as asset,e.sender,package_id,-b.amount/1e9 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountUnstakeEvent'
AND b.coin_type = '0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d::hasui::HASUI'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2 ;

SELECT substr(time_stamp,1,10) as Event_Date
, Asset
, COUNT(DISTINCT transaction_block_digest) as txns
, COUNT(DISTINCT sender) as suppliers
, cast(sum(amount) as decimal(18,4)) as supplied
, current_timestamp as Insert_TS
FROM (
SELECT e.time_stamp,e.transaction_block_digest,type_,'vSUI' as asset,e.sender,package_id,-b.amount/1e9 as amount
FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest
WHERE package_id IN ('0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a')
AND type_ = '0xe87f1b2d498106a2c61421cec75b7b5c5e348512b0dc263949a0e7a3c256571a::user::SpoolAccountUnstakeEvent'
AND b.coin_type = '0x549e8b69270defbfafd4f94e17ec44cdbdd99820b33bda2278dea3b9a32d3f55::cert::CERT'
AND e.time_stamp BETWEEN current_date-60 and current_date+1
) x
GROUP BY 1,2
ORDER BY 1 DESC