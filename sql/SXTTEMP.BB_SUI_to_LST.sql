SELECT 
  Protocol
, SUM(txns) as Txns
, SUM(users) as Users
, cast(SUM(amount) as decimal(18,4)) as Amount
, current_timestamp as Insert_TS
FROM (
    SELECT date_trunc('day',SUI.STAKING_REQUEST_EVENT.TIME_STAMP) as day, CASE WHEN SUI.STAKING_REQUEST_EVENT.PACKAGE_ID = '0xf325ce1300e8dac124071d3152c5c5ee6174914f8bc2161e88329cf579246efc' OR SUI.STAKING_REQUEST_EVENT.PACKAGE_ID = '0x7f6ce7ade63857c4fd16ef7783fed2dfc4d7fb7e40615abdb653030b76aef0c6' THEN 'Aftermath' WHEN SUI.STAKING_REQUEST_EVENT.PACKAGE_ID = '0x549e8b69270defbfafd4f94e17ec44cdbdd99820b33bda2278dea3b9a32d3f55' THEN 'Volo' ELSE SUI.STAKING_REQUEST_EVENT.PACKAGE_ID END AS protocol,COUNT(DISTINCT SUI.STAKING_REQUEST_EVENT.TRANSACTION_BLOCK_DIGEST) as txns,COUNT(DISTINCT SUI.STAKING_REQUEST_EVENT.STAKER_ADDRESS) as users,SUM(SUI.STAKING_REQUEST_EVENT.AMOUNT/1e9) as amount
    FROM SUI.STAKING_REQUEST_EVENT 
    WHERE time_stamp between current_date-60 and current_date+1 
    AND package_id NOT IN ('0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d','0x0000000000000000000000000000000000000000000000000000000000000003','0x67e77b4e79e8c157e42c18eecf68e25047f6f95e657bd65387189411f2898ce3'
    ,'0x26346e185003acbf732d373c60413cee41996a9fbdf8790ae1b7385f6a6a9b32'
    ,'0x6837bb1ea5fe115cdfbaff11dca005dc5105a42a1b0848ed6029db2f43fc5622'
    ,'0xd8b531618214d62ea8d6b21e939a9af09e569b87d870d97d251cc74cb0d49e4b'
    ,'0xb64dfb9fda533f2db8feeeb67dd2fd95ce188c20efca9322e64c106218e2efad'
    ,'0x60cce9054185bfcc5d811bc146e646cd11f2bd04512a8eb517f72257a15e4290'
    ,'0xb5ff0f2d5d2824a5b3a0a221133fa52ea24f25bf3fcb115dc5db42448fb44d1d',
    '0x8849cd0b94b6c24cc7818e2b50a711a0114f8b276266453a8790fd959d9f7f5f',
    '0x6b422a6e0ca9a52366660462f6249cb43806c45226b06e8f805c39c7a087862f') 
    AND amount > 1 
    GROUP BY 1,2 UNION All 
    SELECT date_trunc('day',e.time_stamp) as day,CASE WHEN package_id = '0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d' THEN 'Haedal' ELSE package_id END AS protocol,COUNT(DISTINCT e.transaction_block_digest) as txns,COUNT(DISTINCT sender) as users,SUM(-b.amount/1e9) as amount
    FROM SUI.EVENTS e LEFT JOIN SUI.BALANCE_CHANGES b ON e.transaction_block_digest = b.transaction_block_digest WHERE package_id = '0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d' AND type_ IN ('0xbde4ba4c2e274a60ce15c1cfff9e5c42e41654ac8b6d906a57efa4bd3c29f47d::staking::UserStaked') 
    AND package_id != '0xb5ff0f2d5d2824a5b3a0a221133fa52ea24f25bf3fcb115dc5db42448fb44d1d'
    AND b.coin_type = '0x2::sui::SUI' AND e.time_stamp between current_date-60 and current_date+1 
    GROUP BY 1,2 
) GROUP BY 1 