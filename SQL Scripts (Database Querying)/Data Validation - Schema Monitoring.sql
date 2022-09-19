--  -----
-- RULE SET #8: DIFF CHECKS
--  -----

-- Test 01 - Verify TableStructure("BySQL") by comparing snapshot in SQL code vs actual schema/structure for table [locations] 
    WITH expected 
    AS (
			  SELECT 1 AS ord_pos, 'location_id'    AS column_nm, 'integer(32)'           AS data_typ, 'NOT NULL' AS nullable
		UNION SELECT 2 AS ord_pos, 'street_address' AS column_nm, 'character varying(40)' AS data_typ, 'NULL' AS nullable
		UNION SELECT 3 AS ord_pos, 'postal_code'    AS column_nm, 'character varying(12)' AS data_typ, 'NULL' AS nullable
		UNION SELECT 4 AS ord_pos, 'city'           AS column_nm, 'character varying(30)' AS data_typ, 'NOT NULL' AS nullable
		UNION SELECT 5 AS ord_pos, 'state_province' AS column_nm, 'character varying(25)' AS data_typ, 'NULL' AS nullable
		UNION SELECT 6 AS ord_pos, 'country_id'     AS column_nm, 'character(2)'          AS data_typ, 'NULL' AS nullable
		ORDER BY ord_pos
    )
	, actual_base_tbl
	AS (
        SELECT table_schema AS SchemaName
        , table_catalog
        , table_type, table_name, table_schema
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = ' demo_data' 
          AND TABLE_TYPE = 'BASE TABLE'
	)
    , actual
    AS (
		SELECT
		  RIGHT('000' || CAST(tut.ORDINAL_POSITION AS VARCHAR(3)), 3) AS ord_pos
		, tut.column_name                                            AS column_nm
		, COALESCE(tut.data_type, 'unknown') || 
		  CASE WHEN tut.DATA_TYPE IN('varchar','nvarchar')    THEN '(' || CAST(tut.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE IN('char','nchar')          THEN '(' || CAST(tut.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE ='date'                     THEN '(' || CAST(tut.DATETIME_PRECISION AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE ='datetime'                 THEN '(' || CAST(tut.DATETIME_PRECISION AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE LIKE '%int%'                THEN '(' || CAST(tut.NUMERIC_PRECISION AS VARCHAR(10))  || ')'
			   WHEN tut.DATA_TYPE = 'uniqueidentifier'        THEN '(16)'
			   WHEN tut.DATA_TYPE = 'money'                   THEN '(' || CAST(tut.NUMERIC_PRECISION AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE = 'decimal'                 THEN '(' || CAST(tut.NUMERIC_PRECISION AS VARCHAR(10)) || ',' || CAST(tut.NUMERIC_SCALE AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE = 'numeric'                 THEN '(' || CAST(tut.NUMERIC_PRECISION AS VARCHAR(10)) || ',' || CAST(tut.NUMERIC_SCALE AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE = 'varbinary'               THEN '(' || CAST(tut.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE = 'xml'                     THEN '(' || CAST(tut.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)) || ')'
			   WHEN tut.DATA_TYPE IN('char','nchar')          THEN '(' || CAST(tut.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)) || ')'
			   WHEN tut.CHARACTER_MAXIMUM_LENGTH IS NOT NULL  THEN '(' || CAST(tut.CHARACTER_MAXIMUM_LENGTH AS VARCHAR(10)) || ')'
			   WHEN tut.DATETIME_PRECISION IS NOT NULL        THEN '(' || CAST(tut.DATETIME_PRECISION AS VARCHAR(10)) || ')'
			   WHEN tut.NUMERIC_PRECISION IS NOT NULL
				AND tut.NUMERIC_SCALE     IS NULL             THEN '(' || CAST(tut.NUMERIC_PRECISION AS VARCHAR(10)) || ')'
			   WHEN tut.NUMERIC_PRECISION IS NOT NULL
				AND tut.NUMERIC_SCALE     IS NOT NULL         THEN '(' || CAST(tut.NUMERIC_PRECISION AS VARCHAR(10)) || ',' || CAST(tut.NUMERIC_SCALE AS VARCHAR(10)) || ')'
			   ELSE ''
		  END AS data_typ
		, CASE WHEN tut.IS_NULLABLE = 'YES' THEN 'NULL' ELSE 'NOT NULL' END AS nullable
		FROM       INFORMATION_SCHEMA.COLUMNS tut
		INNER JOIN actual_base_tbl            bt  ON bt.table_catalog = tut.TABLE_CATALOG AND bt.table_name = tut.table_name
		WHERE tut.table_name = 'locations'
    )
    , dut -- Data Under Test 
    AS (
    	SELECT CASE WHEN (SELECT COUNT(*) FROM actual) = 0        THEN 'REJ-01: Table [locations] does not exist (may be case sensistive name)|exp=exists|act=notExist' 
    	            WHEN a.column_nm IS NULL                      THEN 'REJ-01: Expected column is missing from actual schema (may be case sensitive name)|exp=' || e.column_nm || '|act=IsMissing' 
    	            WHEN CAST(a.ord_pos AS INTEGER) <> e.ord_pos  THEN 'REJ-02: Ordinal Positions at field ' || e.column_nm || ' do not match|exp=' || CAST(e.ord_pos AS VARCHAR(3)) || '|act=' || CAST(a.ord_pos AS VARCHAR(3))
    	            WHEN a.data_typ <> e.data_typ                 THEN 'REJ-03: Data Types at field ' || e.column_nm || ' do not match|exp=' || e.data_typ || '|act=' || a.data_typ 
    	            WHEN a.nullable <> e.nullable                 THEN 'REJ-04: Nullable settings at field ' || e.column_nm || ' do not match|exp=' || e.nullable || '|act=' || a.nullable 
    	            ELSE 'P'
    	       END AS status
    	FROM      expected e 
    	LEFT JOIN actual   a ON a.column_nm = e.column_nm
    )

    SELECT 'Test 01' AS tst_id
         , CASE WHEN COUNT(*) = 0 THEN 'P' ELSE 'FAIL' END status
         , '"RS-8 Diffs" #1 - Verify TableStructure("BySQL") by comparing snapshot in SQL code vs actual schema/structure for table [locations]' AS tst_descr   
    FROM dut WHERE status <> 'P';
    
    


-- Test 02 - Verify TableData("BySQL") - Data should not change for table [regions] 
    WITH metadata 
    AS (
    	      SELECT 1 AS region_id, 'Europe' AS region_name
    	UNION SELECT 2 AS region_id, 'Americas' AS region_name
    	UNION SELECT 3 AS region_id, 'Asia' AS region_name
    	UNION SELECT 4 AS region_id, 'Middle East and Africa' AS region_name
    	ORDER BY region_id
    )
    , dut -- Data Under Test 
    AS (
    	SELECT CASE WHEN r.region_id IS NULL            THEN 'REJ-01: Record is missing from metadata|exp=NotMissing|act=' || m.region_id || ' is missing' 
    	            WHEN r.region_name <> m.region_name THEN 'REJ-02: Region_Name does not match|exp=' || m.region_name || '|act=' || r.region_name 
    	            ELSE 'P'
    	       END AS status
    	FROM      metadata   m 
    	LEFT JOIN  demo_data.regions r ON r.region_id = m.region_id
    	ORDER BY m.region_id
    )
    
    SELECT 'Test 02' AS tst_id
         , CASE WHEN COUNT(*) = 0 THEN 'P' ELSE 'FAIL' END status
         , '"RS-8 Diffs" #2 - Verify TableData("BySQL") - Data should not change for table [regions]' AS tst_descr   
    FROM dut WHERE status <> 'P';


-- Test 03 - Verify TableData("By2TableCompare") - Table data should exactly match between tables [jobs] and [jobs_snapshot]
    WITH non_matches
    AS (
        SELECT MAX(tbl_nm) AS tbl_nm, job_id, job_title, min_salary, max_salary, COUNT(*) AS match_count_found
        FROM (
    		SELECT CAST('jobs' AS VARCHAR(15)) AS tbl_nm,          job_id, job_title, min_salary, max_salary FROM  demo_data.JOBS  
    		UNION ALL 
    		SELECT CAST('jobs_snapshot' AS VARCHAR(15)) AS tbl_nm, job_id, job_title, min_salary, max_salary FROM  demo_data.JOBS_SNAPSHOT 
        ) comb_sets 
        GROUP BY job_id, job_title, min_salary, max_salary
        HAVING COUNT(*) < 2
    )
    , dut -- Data Under Test 
    AS (
    	SELECT 'REJ-01: Mismatch Found: tbl_nm="' || tbl_nm ||'", job_id="' || job_id || '", job_title="' || job_title 
    	    || '", min_salary=' || CAST(min_salary AS VARCHAR(20)) || '", max_salary=' || CAST(max_salary AS VARCHAR(20)) AS status
    	FROM      non_matches  
    	ORDER BY 1
    )

    SELECT 'Test 03' AS tst_id
         , CASE WHEN COUNT(*) = 0 THEN 'P' ELSE 'FAIL' END status
         , '"RS-8 Diffs" #3 - Verify TableData("By2TableCompare") - Table data should exactly match between tables [jobs] and [jobs_snapshot]' AS tst_descr   
    FROM dut WHERE status <> 'P';