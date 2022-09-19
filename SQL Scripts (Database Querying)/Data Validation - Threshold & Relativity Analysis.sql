--Set of scripts to be used in data validation for defining thresholds as presented in the tables in the database.

-- Test 01 - Verify NullRateThresholds() for specific columns (eg: columnX is NULL for < 5% of the data ) in table [countries]
    WITH dtls AS (
        SELECT CASE WHEN nr_dept_nm  > 0.0000 THEN 'REJ-01: Null rate too high at department_name.  Exp=0.0000 / Act=' || CAST(nr_dept_nm AS VARCHAR(8))
                    WHEN nr_mgr_id   > 0.6500 THEN 'REJ-02: Null rate too high at manager_id.  Exp<=0.6500 / Act=' || CAST(nr_mgr_id AS VARCHAR(8))
                    WHEN nr_url      > 0.8000 THEN 'REJ-03: Null rate too high at url.  Exp<=0.8000 / Act=' || CAST(nr_url AS VARCHAR(8))
                    ELSE 'P'
               END AS status
        FROM (
            SELECT CAST(SUM(CASE WHEN department_name IS NULL THEN 1 ELSE 0 END) AS DOUBLE PRECISION) / CAST(COUNT(*) AS DOUBLE PRECISION) AS nr_dept_nm
                 , CAST(SUM(CASE WHEN manager_id      IS NULL THEN 1 ELSE 0 END) AS DOUBLE PRECISION) / CAST(COUNT(*) AS DOUBLE PRECISION) AS nr_mgr_id
                 , CAST(SUM(CASE WHEN url             IS NULL THEN 1 ELSE 0 END) AS DOUBLE PRECISION) / CAST(COUNT(*) AS DOUBLE PRECISION) AS nr_url
            FROM  demo_data.departments
        ) t
    )
    
    SELECT 'Test 01' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status 
         , '"RS-3 Heuristics" #1 - Verify NullRateThresholds() for specific columns (eg: columnX is NULL for < 5% of the data ) in table [countries]' AS tst_descr   
    FROM dtls 
    WHERE status <> 'P';


-- Test 02 - Verify ValueFrequencyThresholds()" for [region_id] values (eg: value=1 for 28% to 36% of rows) in table [countries]
    WITH dtls AS (
        SELECT region_id, freq_rt
             , CASE WHEN region_id = 1  AND freq_rt NOT BETWEEN 0.28 AND 0.36 THEN 'REJ-01: Frequency occurrence of region_id=1 is outside threshold|exp=0.28 thru 0.36|act=' || CAST(freq_rt AS VARCHAR(8))
                    WHEN region_id = 2  AND freq_rt NOT BETWEEN 0.16 AND 0.24 THEN 'REJ-02: Frequency occurrence of region_id=2 is outside threshold|exp=0.16 thru 0.24|act=' || CAST(freq_rt AS VARCHAR(8))
                    WHEN region_id = 3  AND freq_rt NOT BETWEEN 0.20 AND 0.28 THEN 'REJ-03: Frequency occurrence of region_id=3 is outside threshold|exp=0.20 thru 0.28|act=' || CAST(freq_rt AS VARCHAR(8))
                    WHEN region_id = 4  AND freq_rt NOT BETWEEN 0.20 AND 0.28 THEN 'REJ-04: Frequency occurrence of region_id=4 is outside threshold|exp=0.20 thru 0.28|act=' || CAST(freq_rt AS VARCHAR(8))
                    ELSE 'P'
               END AS status
        FROM (
            SELECT region_id, CAST(freq AS DOUBLE PRECISION) / CAST(den AS DOUBLE PRECISION) AS freq_rt
        	FROM (
        	    SELECT region_id, COUNT(*) AS freq
        	    , (SELECT COUNT(*) FROM  demo_data.countries) AS den
                FROM  demo_data.countries
                GROUP BY region_id
            ) t
        ) t2
    )
    
    SELECT 'Test 02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status 
         , '"RS-3 Heuristics" #2 - Verify ValueFrequencyThresholds()" for [region_id] values (eg: value=1 for 28% to 36% of rows) in table [countries]' AS tst_descr   
    FROM dtls 
    WHERE status <> 'P';
