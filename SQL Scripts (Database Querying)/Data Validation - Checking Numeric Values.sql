--Set of scripts to be used in data validation for checking numeric values as presented in the tables in the database.

    -- Test 00 - Verify NoNulls() at [region_id] in table [countries]
	SELECT 'Test 00' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-4 Numeric" #1 - Verify NoNulls() at [region_id] in table [countries]' AS tst_descr   
	FROM demo_data.countries
	WHERE region_id IS NULL;

	
-- Test 01 - Verify NotNegative() where [region_id] >= 0 in table [countries]
	SELECT 'Test 01' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-4 Numeric" #2 - Verify NotNegative() where [region_id] >= 0 in table [countries]' AS tst_descr   
	FROM demo_data.countries
	WHERE region_id < 0;

	
-- Test 02 - Verify NumericRange() where [employee_id] between 100 and 999 in table [employees]
    SELECT 'Test 02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-4 Numeric" #3 - Verify NumericRange() where [employee_id] between 100 and 999 in table [employees]' AS tst_descr   
    FROM (
    	SELECT employee_id
             , CASE WHEN employee_id < 100   THEN 'REJ-01: Verify employee_id > 99|exp>99|act=' || CAST(employee_id AS VARCHAR(10))
    	            WHEN employee_id > 999   THEN 'REJ-02: Verify employee_id < 1000|exp<1000|act=' || CAST(employee_id AS VARCHAR(10))
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


-- Test 03 - Verify InValueList() where [region_id] is in list (1,2,3,4) at table [countries]
    SELECT 'Test 03' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-4 Numeric" #4 - Verify InValueList() where [region_id] is in list (1,2,3,4) at table [countries]' AS tst_descr   
    FROM (
    	SELECT region_id
             , CASE WHEN region_id NOT IN(1,2,3,4) THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.countries
    ) t
    WHERE status <> 'P';


-- Test 04 - Verify NotInValueList() where [region_id] is not in list (97,98,99) at table [countries]
    SELECT 'Test 04' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-4 Numeric" #5 - Verify NotInValueList() where [region_id] is not in list (97,98,99) at table [countries]' AS tst_descr   
    FROM (
    	SELECT region_id
             , CASE WHEN region_id IN(97,98,99) THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.countries
    ) t
    WHERE status <> 'P';


-- Test 05 - Verify MultiFieldCompare() where [salary] x [commission_pct] <= $10,000 cap in table [employees]
    SELECT 'Test 05' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-4 Numeric" #6 - Verify MultiFieldCompare() where [salary] x [commission_pct] <= $10,000 cap in table [employees]' AS tst_descr   
    FROM (
        SELECT salary, commission_pct
             , CASE WHEN salary * commission_pct > 10000 THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';