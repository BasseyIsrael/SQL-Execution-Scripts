
--Set of scripts to be used in data validation for checking known defects with defects regression that come up over time in the database.

-- Test 02 - Verify ValueFrequencyThresholds()" for [region_id] values (eg: value=1 for 28% to 36% of rows) in table [countries]
    WITH dut -- data under test
    AS (
    	SELECT region_id
    	, CAST(freq AS DOUBLE PRECISION) / CAST(den AS DOUBLE PRECISION) AS freq_rt
    	FROM (
    	    SELECT region_id, COUNT(*) AS freq
    	    , (SELECT COUNT(*) FROM  demo_data.countries) AS den
            FROM  demo_data.countries
            GROUP BY region_id
        ) t
    )
    , bll -- business logic layer: apply heuristics...what constitutes a pass or a fail?
    AS (
    	SELECT region_id, freq_rt
             , CASE WHEN region_id = 1  AND freq_rt NOT BETWEEN 0.10 AND 0.50 then 'FAIL: Frequency occurrence of region_id=1 is FAR outside threshold|exp=0.28 thru 0.36|act=' || CAST(freq_rt AS VARCHAR(8))
                    WHEN region_id = 1  AND freq_rt NOT BETWEEN 0.25 AND 0.35 then 'WARN: Frequency occurrence of region_id=1 is outside threshold|exp=0.20 thru 0.28|act=' || CAST(freq_rt AS VARCHAR(8))
                    ELSE 'P'
    	       END AS status
    	FROM dut
    )
    -- SELECT * FROM bll;
	
    SELECT 'Test 02' AS tst_id
         , CASE WHEN (SELECT COUNT(*) FROM bll) = 0 THEN 'SKIP'
	            WHEN (SELECT COUNT(*) FROM bll WHERE status LIKE 'FAIL:%') > 0 THEN 'FAIL'
	            WHEN (SELECT COUNT(*) FROM bll WHERE status LIKE 'WARN:%') > 0 THEN 'WARN'
	            ELSE 'P'
	       END AS status
         , '"X#1 WarnSkip" - Verify ValueFrequencyThresholds()" for [region_id] values (eg: value=1 for 28% to 36% of rows) in table [countries]' AS tst_descr   
	;

 
-- Test 03  
    SELECT 'T02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"X#2 LimitToRecent" - VerVerify NoNulls() at [region_id] in table [countries] for past 30 days' AS tst_descr   
    FROM (
    	SELECT region_id, date_last_updated
             , CASE WHEN region_id IS NULL  THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.countries
    	WHERE date_last_updated >= NOW() - INTERVAL '30 DAY' 
    ) t
    WHERE status <> 'P';


-- Test 04 - Verify NoNulls() at [region_id] in table [countries]; ignoring 3 known bad rows 
    SELECT 'Test 04' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"X#3 IgnoreBadRows" - Verify NoNulls() at [region_id] in table [countries]; ignoring 3 known bad rows' AS tst_descr   
    FROM (
    	SELECT region_id, country_id
             , CASE WHEN region_id IS NULL  THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.countries
    	WHERE country_id NOT IN('BR','DK','IL') 
    ) t
    WHERE status <> 'P';


-- Test 05 - Verify dozens of checks in a single table scan pass against table [employees] for best performance
    SELECT 'Test 05' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"X#4 TableScan" - Verify dozens of checks in a single table scan pass against table [employees] for best performance' AS tst_descr   
    FROM (
    SELECT CASE WHEN employee_id < 100                                        THEN 'REJ-01: Field employee_id > 99|exp>99|act=' || CAST(employee_id AS VARCHAR(10))
	            WHEN employee_id > 999                                        THEN 'REJ-02: Field employee_id < 1000|exp<1000|act=' || CAST(employee_id AS VARCHAR(10))
	            WHEN salary * commission_pct > 10000                          THEN 'REJ-03: Fields salary x commission_pct <= $10,000|exp<10,000|act=' || CAST(salary * commission_pct AS VARCHAR(15))
				WHEN TO_CHAR(hire_date, 'hh:mi:ss') <> '12:00:00'             THEN 'REJ-04: Field hire_date cannot have a time part|exp=12:00:00|act=' || TO_CHAR(hire_date, 'hh:nn:ss')
                WHEN NOT zip5 ~ '^[0-9]+$'                                    THEN 'REJ-05: Field zip5 failed RegExpression check|exp=Like"^[0-9]+$"|act=' || zip5 
	            WHEN job_id IN('CEO','CFO','COO','CIO','POTUS')               THEN 'REJ-06: Verify job_id not in domain list of excluded values|exp<>1of5|act=' || job_id
	            WHEN email <> SUBSTRING(UPPER(SUBSTRING(
	                            first_name, 1, 1) || last_name), 1, 8)        THEN 'REJ-07: Field email <> first char of first_name + last_name|exp=' || SUBSTRING(UPPER(SUBSTRING(first_name, 1, 1) || last_name), 1, 8) || '|act=' || email
	            WHEN LENGTH(phone_number) NOT IN(12,18)                       THEN 'REJ-08: Field phone_number length is allowed|exp=12,18|act=' || CAST(LENGTH(phone_number) AS VARCHAR(6))
	            WHEN job_id ~ '[[:lower:]]'                                   THEN 'REJ-09: Field job_id does not contain lower case characters|exp=ucase|act=' || EMAIL
	            WHEN NOT SUBSTRING(LAST_NAME,1) ~ '[[:upper:]]'               THEN 'REJ-10: Field last_name after first char is all lower case|exp=lcase|act=' || LAST_NAME 
	            WHEN some_date_fmt1 ~ '[[:alpha:]]'                           THEN 'REJ-11: Field employee_id does not contain alpha characters|exp=no-alphas|act=' || SOME_DATE_FMT1
                WHEN last_name ~ '[[:digit:]]'                                THEN 'REJ-12: Field last_name does not contain numeric digits|exp=no-digits|act=' || LAST_NAME 
	            WHEN first_name LIKE '%''%'                                   THEN 'REJ-13: Field first_name does not contain single quote characters|exp=none|act=' || first_name
                WHEN first_name LIKE '%"%'                                    THEN 'REJ-14: Field first_name does not contain quotation characters|exp=none|act=' || first_name
                WHEN POSITION(CHR(10) IN last_name)  > 0                      THEN 'REJ-15: Field last_name has a Line Feed (CHR-10)|exp=none|act=at position ' || CAST(POSITION(CHR(10) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(13) IN last_name)  > 0                      THEN 'REJ-16: Field last_name has a Carriage Return (CHR-13)|exp=none|act=at position ' || CAST(POSITION(CHR(13) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(9)  IN last_name)  > 0                      THEN 'REJ-17: Field last_name has a Tab (CHR-9)|exp=none|act=at position ' || CAST(POSITION(CHR(9) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(160) IN last_name) > 0                      THEN 'REJ-18: Field last_name has a Non-Breaking-Space (CHR-160)|exp=none|act=at position ' || CAST(POSITION(CHR(160) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(151) IN last_name) > 0                      THEN 'REJ-19: Field last_name has a Non-Breaking-Space (CHR-151)|exp=none|act=at position ' || CAST(POSITION(CHR(151) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(11) IN last_name)  > 0                      THEN 'REJ-20: Field last_name has a Vertical Tab (CHR-11)|exp=none|act=at position ' || CAST(POSITION(CHR(11) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(12) IN last_name)  > 0                      THEN 'REJ-21: Field last_name has a Form Feed (CHR-12)|exp=none|act=at position ' || CAST(POSITION(CHR(12) IN last_name) AS VARCHAR(4))
	            WHEN POSITION(CHR(133) IN last_name) > 0                      THEN 'REJ-22: Field last_name has a Next Line (CHR-133)|exp=none|act=at position ' || CAST(POSITION(CHR(133) IN last_name) AS VARCHAR(4))
	            WHEN POSITION('.' IN last_name) > 0                           THEN 'REJ-23: Field last_name has a period|exp=none|act=at position ' || CAST(POSITION('.' IN last_name) AS VARCHAR(4))
	            WHEN last_name ~ '[,/:()&#?;]'                                THEN 'REJ-24: Field last_name has a ",/:()&#?;" characters|exp=none|act=' || last_name 
	            WHEN phone_number ~ '[^.0123456789]'                          THEN 'REJ-25: Field phone_number can only have characters ".012345789"|exp=onlyAlloweChars|act=' || phone_number 
	            WHEN phone_number NOT LIKE '%.%'                              THEN 'REJ-26: Verify phone_number contains a ''.''|exp=contains-.|act=' || phone_number
                WHEN phone_number NOT LIKE '___.___.____' 
                 AND phone_number NOT LIKE '011.__.____._____%'               THEN 'REJ-27: Verify phone_number like pattern "___.___.____" or "011.__.____._____"|exp=yes|act=' || phone_number
	            WHEN NOT zip5 ~ '^\d+(\.\d+)?$'                               THEN 'REJ-28: Field zip9 will not convert to a number|exp=converts to number|act=' || zip5 
	            WHEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
	                 REPLACE(REPLACE(REPLACE(some_date_fmt1,'0',''),'1','')
	                 ,'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8'
	                 ,''),'9','')  > ''                                       THEN 'REJ-29: Unexpected chars exist (numeric 0-9 only)|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                WHEN NOT LENGTH(TRIM(some_date_fmt1)) = 8                     THEN 'REJ-30: Must be 8 Chars|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                WHEN NOT SUBSTRING(some_date_fmt1,1,4) BETWEEN '1753' AND '9999' THEN 'REJ-31: Year Not Btw 1753-9999|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                WHEN NOT SUBSTRING(some_date_fmt1,5,2) BETWEEN '01' AND '12'     THEN 'REJ-32: Month Not Btw 01-12|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                WHEN NOT SUBSTRING(some_date_fmt1,7,2) BETWEEN '01' AND '31'     THEN 'REJ-33: Day Not Btw 01-31|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
	            ELSE 'P'
    	       END AS status
    	FROM  demo_data.employees
        WHERE email NOT IN('DRAPHEAL', 'JAMRLOW', 'JMURMAN', 'LDEHAAN', 'JRUSSEL', 'TJOLSON')  
    	               -- DRAPHAEL vs DRAPHEAL, JMARLOW vs JAMRLOW, JMURMAN vs JURMAN, LDE HAAN VS LDEHAAN, JRUSSELL vs JRUSSEL, TOLSON vs TJOLSON)
    ) t
    WHERE status <> 'P';


-- Test 06 - Reference configuration settings from a temporary lookup table
    DROP TABLE IF EXISTS test_case_config;
    CREATE TEMP TABLE test_case_config (
      prop_nm     VARCHAR(99)
    , prop_val    VARCHAR(255)
    );
	INSERT INTO test_case_config VALUES('NumberDaysLookBack','100');


    SELECT 'Test 06' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"X#5 ConfigTbl" - Reference configuration settings from a temporary lookup table' AS tst_descr   
    FROM (
        SELECT CASE WHEN row_count < 5 THEN 'FAIL'
                    ELSE 'P'
               END AS status
        FROM (
            SELECT COUNT(*) AS row_count 
            FROM  demo_data.countries
            WHERE date_last_updated >= NOW()::DATE - (SELECT CAST(prop_val AS INTEGER)
                                                      FROM test_case_config 
                                                      WHERE prop_nm = 'NumberDaysLookBack')
        ) t
    ) t2
    WHERE status <> 'P';