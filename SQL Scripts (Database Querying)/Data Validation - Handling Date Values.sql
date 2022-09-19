--Set of scripts to be used in data validation for handling date values as presented in the tables in the database.

--  Test 01 - - Verify NoNulls() where [date_last_updated] has no nulls in table [countries]
    SELECT ' Test 01' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-5 Dates" #1 - Verify NoNulls() where [date_last_updated] has no nulls in table [countries]' AS tst_descr   
    FROM (
    	SELECT date_last_updated
             , CASE WHEN date_last_updated IS NULL THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.countries
    ) t
    WHERE status <> 'P';

	
--  Test 02 - Verify DateRange() where [date_last_updated] is not in the future nor too "old" at table [countries]
    SELECT ' Test 02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-5 Dates" #2 - Verify DateRange() where [date_last_updated] is not in the future nor too "old" at table [countries]' AS tst_descr   
    FROM (
    	SELECT date_last_updated
             , CASE WHEN date_last_updated > CLOCK_TIMESTAMP()                   THEN 'REJ-01: Field date_last_updated cannot be in the future|exp<=' || CAST(CLOCK_TIMESTAMP() AS VARCHAR(20)) || '|act=' || CAST(date_last_updated AS VARCHAR(20))
    	            WHEN date_last_updated < TO_DATE('01/01/2021', 'mm/dd/yyyy') THEN 'REJ-02: Field date_last_updated cannot be too old|exp>=1/1/2021|act=' || CAST(date_last_updated AS VARCHAR(20))
    	            ELSE 'P'
    	       END AS status
    	FROM  demo_data.countries
    ) t
    WHERE status <> 'P';


--  Test 03 - Verify NoTimePart() where [hire_date] has no time part (is "12:00:00") in table [employees]
    SELECT ' Test 03' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-5 Dates" #3 - Verify NoTimePart() where [hire_date] has no time part (is "12:00:00") in table [employees]' AS tst_descr   
    FROM (
        SELECT hire_date
             , CASE WHEN TO_CHAR(hire_date, 'hh:mi:ss') <> '12:00:00' THEN 'FAIL' ELSE 'P' END AS status
        FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 04 - Verify HasTimePart() where [start_tm] has time part (is not 12:00:00) at table [test_case_results]
    SELECT ' Test 04' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-5 Dates" #4 - Verify HasTimePart() where [start_tm] has time part (is not 12:00:00) at table [test_case_results]' AS tst_descr   
    FROM (
    	SELECT date_last_updated
             , CASE WHEN TO_CHAR(date_last_updated, 'hh:mi:ss') = '12:00:00' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.countries
    ) t
    WHERE status <> 'P';


-- Test 05 - Verify MultiFieldCompare() where [start_date] must be < [end_date] in table [job_history]
    SELECT 'Test 05' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-5 Dates" #5 - Verify MultiFieldCompare() where [start_date] must be < [end_date] in table [job_history]' AS tst_descr   
    FROM (
        SELECT start_date, end_date
             , CASE WHEN start_date >= end_date THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.job_history
    ) t
    WHERE status <> 'P';
