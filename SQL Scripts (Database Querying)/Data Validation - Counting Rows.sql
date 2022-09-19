--Set of scripts to be used in data validation for verifying count of rows as presented in the tables in the database.


-- Test 01 ------------------------------------------------------------------------------------------
	SELECT 'Test 01' AS tst_id
	     , CASE WHEN COUNT(*) <> 25 THEN 'FAIL' ELSE 'P' END AS status 
	     , '"RS-1 Row Counts" #1 - Verify FullRowCount() = 25 at table [countries]' AS tst_descr   
	FROM demo_data.countries;


-- Test 02 ------------------------------------------------------------------------------------------
	SELECT 'Test 02' AS tst_id
         , CASE WHEN COUNT(*) <> 8 THEN 'FAIL' ELSE 'P' END AS status   
         , '"RS-1 Row Counts" #2 - Verify PartialRowCount() = 8 where [region_id] = 1 (Europe) in table [countries]' AS tst_descr   
	FROM demo_data.countries
	WHERE region_id = 1;


-- Test 03 ------------------------------------------------------------------------------------------
	SELECT 'Test 03' AS tst_id
         , CASE WHEN countries_count < 5 * regions_count THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-1 Row Counts" #3 - Verify RelativeRowCount() table [countries] row count >= 5x table [regions] row count' AS tst_descr   
    FROM (
    	SELECT (SELECT COUNT(*) AS row_count FROM demo_data.countries) AS countries_count 
    	     , (SELECT COUNT(*) AS row_count FROM demo_data.regions)   AS regions_count
    ) t;


-- Test 04 ------------------------------------------------------------------------------------------
	SELECT 'Test 04' AS tst_id
         , CASE WHEN row_count < 5 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-1 Row Counts" #4 - Verify RecentRowCount() >= 5 in table [countries] where [date_last_updated] in past' AS tst_descr   
	FROM (
        SELECT COUNT(*) AS row_count 
        FROM demo_data.countries
        WHERE date_last_updated >= NOW()::DATE - 150
	) t;