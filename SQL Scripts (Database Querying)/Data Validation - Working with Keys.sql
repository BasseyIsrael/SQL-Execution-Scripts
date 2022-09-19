--Set of scripts to be used in data validation for working with foreign keys in relation to parents as presented in the tables in the database.


-- Test 01 - Verify UkeyHasNoDups() for UKey [country_name] in table [countries]
    SELECT 'Test 01' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-2 Keys" #1 - Verify UkeyHasNoDups() for UKey [country_name] in table [countries]' AS tst_descr   
    FROM (
        SELECT country_name             -- UKey fields 
    	     , COUNT(*) AS match_count 
    	FROM  demo_data.countries          -- UKey fields 
    	GROUP BY country_name 
    	HAVING COUNT(*) > 1
    ) t;


-- Test 02 - Verify FKeyChildNotOrphans() at FKey-Child [region_id] in table [countries]
    SELECT 'Test 02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-2 Keys" #2 - Verify FKeyChildNotOrphans() at FKey-Child [region_id] in table [countries]' AS tst_descr   
    FROM (
    	SELECT DISTINCT c.region_id AS child_id, p.region_id AS parent_id
    	FROM       demo_data.countries c 
    	LEFT JOIN  demo_data.regions   p  
        ON p.region_id = c.region_id
    	WHERE p.region_id IS NULL
    ) t;


-- Test 03 - Verify FKeyParentHasChildren() at FKey-Parent [country_id] in table [countries] for select Countries
    SELECT 'Test 03' AS tst_id
         , CASE WHEN COUNT(*) >= 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-2 Keys" #3 - Verify FKeyParentHasChildren() at FKey-Parent [country_id] in table [countries] for select Countries' AS tst_descr   
    FROM (
        SELECT DISTINCT c.country_id AS child_id, p.country_id AS parent_id
    	FROM       demo_data.countries p 
    	LEFT JOIN  demo_data.locations c  
        ON p.country_id = c.country_id
    	WHERE c.country_id IS NULL
    	  AND p.country_id IN('IT','JP','US','CA','CN','IN','AU','SG','UK','DE','CH','NL','MX')
	) t;