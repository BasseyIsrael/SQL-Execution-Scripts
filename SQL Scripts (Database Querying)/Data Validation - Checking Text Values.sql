--Set of scripts to be used in data validation for checking text values as presented in the tables in the database.


--  Test 01 - Verify NoNulls() where [country_name] has no nulls in table [countries]
    SELECT ' Test 01' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #01 - Verify NoNulls() where [country_name] has no nulls in table [countries]' AS tst_descr   
    FROM (
    	SELECT country_name
             , CASE WHEN country_name IS NULL THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.countries
    ) t
    WHERE status <> 'P';


--  Test 02 - Verify NoNullStrings() where "" nullstring in [country_name] at table [countries]
    SELECT ' Test 02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #02 - Verify NoNullStrings() where "" nullstring in [country_name] at table [countries]' AS tst_descr   
    FROM (
    	SELECT country_name
             , CASE WHEN country_name = '' THEN 'FAIL' ELSE 'P'  END AS status
    	FROM demo_data.countries
    ) t
    WHERE status <> 'P';

	
--  Test 03 - Verify NoLeadTrailSpaces() at [country_name] in table [countries]
    SELECT ' Test 03' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #03 - Verify NoLeadTrailSpaces() at [country_name] in table [countries]' AS tst_descr   
    FROM (
    	SELECT country_name
             , CASE WHEN country_name LIKE ' %'  THEN 'REJ-01: Verify no leading space at country_name|exp=noLeadSpace|act=''' || country_name ||''''
    				WHEN country_name LIKE '% '  THEN 'REJ-02: Verify no trailing space at country_name|exp=noTrailingSpace|act=''' || country_name ||''''
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.countries
    ) t
    WHERE status <> 'P';


--  Test 04 - Verify InValueList() where [job_id] is in list of valid values for table [employees]
    SELECT ' Test 04' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #04 - Verify InValueList() where [job_id] is in list of valid values for table [employees]' AS tst_descr   
    FROM (
    	SELECT job_id
             , CASE WHEN job_id NOT IN('ST_MAN','ST_CLERK','SH_CLERK','SA_REP','SA_MAN','PU_CLERK','PR_REP','MK_REP','MK_MAN','IT_PROG'
                                      ,'HR_REP','FI_MGR','FI_ACCOUNT','AD_VP','AD_PRES','AD_ASST','AC_MGR','AC_ACCOUNT','PU_MAN')
                    THEN 'FAIL'
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 05 - Verify NotInValueList() where [job_id] not in list of invalid values at table [employees]
    SELECT ' Test 05' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #05 - Verify NotInValueList() where [job_id] not in list of invalid values at table [employees]' AS tst_descr   
    FROM (
    	SELECT job_id
             , CASE WHEN job_id IN('CEO','CFO','COO','CIO','POTUS') THEN 'FAIL'  ELSE 'P'  END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 06 - Verify MultiFieldCompare() where [email] = first letter of [first_name] + [last_name] in table [employees]
    SELECT ' Test 06' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #06 - Verify MultiFieldCompare() where [email] = first letter of [first_name] + [last_name] in table [employees]' AS tst_descr   
    FROM (
    	SELECT email, first_name, last_name
             , CASE WHEN email <> SUBSTRING(UPPER(SUBSTRING(first_name, 1, 1) || last_name), 1, 8) THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.employees
    	WHERE email NOT IN('DRAPHEAL', 'JAMRLOW', 'JMURMAN', 'LDEHAAN', 'JRUSSEL', 'TJOLSON')  
    	                 -- DRAPHAEL vs DRAPHEAL, JMARLOW vs JAMRLOW, JMURMAN vs JURMAN, LDE HAAN VS LDEHAAN, JRUSSELL vs JRUSSEL, TOLSON vs TJOLSON 
    ) t
    WHERE status <> 'P';


--  Test 07 - Verify TextLength() where [phone_number] length is 12 or 18 characters in table [employees]
    SELECT ' Test 07' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #07 - Verify TextLength() where [phone_number] length is 12 or 18 characters in table [employees]' AS tst_descr   
    FROM (
    	SELECT phone_number
             , CASE WHEN LENGTH(phone_number) NOT IN(12,18)  THEN 'REJ-01: Verify phone_number length is allowed|exp=12,18|act=' || CAST(LENGTH(phone_number) AS VARCHAR(5))
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 08 - Verify UpperLowerCaseChars() where [lastname] has all LCase after first character and [job_id] is all UCase in table [employees]
    SELECT ' Test 08' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #08 - Verify UpperLowerCaseChars() where [lastname] has all LCase after first character and [job_id] is all UCase in table [employees]' AS tst_descr   
    FROM (
    	SELECT job_id, last_name
             , CASE WHEN job_id ~ '[[:lower:]]'                     THEN 'REJ-01: Verify job_id does not contain lower case characters|exp=ucase|act=' || job_id
    	            WHEN NOT SUBSTRING(last_name,1) ~ '[[:upper:]]' THEN 'REJ-02: Verify last_name after first char is all lower case|exp=lcase|act=' || last_name 
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';
	

--  Test 09 - Verify AlphaNumericChars() where [employee_id] is numeric, and [lastname] is alpha in table [employees]
    SELECT ' Test 09' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #09 - Verify AlphaNumericChars() where [employee_id] is numeric, and [lastname] is alpha in table [employees]' AS tst_descr   
    FROM (
    	SELECT employee_id, last_name
             , CASE WHEN some_date_fmt1 ~ '[[:alpha:]]' THEN 'REJ-01: Verify some_date_fmt1 does not contain alpha characters|exp=no-alphas|act=' || some_date_fmt1
                    WHEN last_name ~ '[[:digit:]]'      THEN 'REJ-02: Verify last_name does not contain numeric digits|exp=no-digits|act=' || last_name
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 10 - Verify No_Quote_Chars() where [first_name] has no quotes or apostrophes in table [employees]
    SELECT ' Test 10' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #10 - Verify No_Quote_Chars() where [first_name] has no quotes or apostrophes in table [employees]' AS tst_descr   
    FROM (
    	SELECT first_name
             , CASE WHEN first_name LIKE '%''%'  THEN 'REJ-01: Verify first_name does not contain single quote characters|exp=none|act=' || first_name
                    WHEN first_name LIKE '%"%'   THEN 'REJ-02: Verify first_name does not contain quotation characters|exp=none|act=' || first_name
                    ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 11 - Verify No_CRLF_Chars() where [last_name] has no Carriage Returns (CHAR-13) or Line Feeds (CHAR-10) in table [employees]
    SELECT ' Test 11' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #11 - Verify No_CRLF_Chars() where [last_name] has no Carriage Returns (CHAR-13) or Line Feeds (CHAR-10) in table [employees]' AS tst_descr   
    FROM (
        SELECT last_name
             , CASE WHEN POSITION(CHR(10) IN last_name)  > 0 THEN 'REJ-01: Field last_name has a Line Feed (CHR-10)|exp=none|act=at position ' 
	                                                      || CAST(POSITION(CHR(10) IN last_name) AS VARCHAR(4))
	                WHEN POSITION(CHR(13) IN last_name)  > 0 THEN 'REJ-02: Field last_name has a Carriage Return (CHR-13)|exp=none|act=at position ' 
				                                          || CAST(POSITION(CHR(13) IN last_name) AS VARCHAR(4))
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 12 - Verify No_TAB_Chars() where [last_name] has no TAB characters (CHAR-9) in table [employees]
    SELECT ' Test 12' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #12 - Verify No_TAB_Chars() where [last_name] has no TAB characters (CHAR-9) in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN POSITION(CHR(9) IN last_name)   > 0 THEN 'REJ-01: Field last_name has a Tab (CHR-9)|exp=none|act=at position ' || CAST(POSITION(CHR(9) IN last_name) AS VARCHAR(4))
		            ELSE 'P'
		       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 13 - Verify No_NBS_Chars() where [last_name] has no Non-Breaking-Spaces (CHAR-160) in table [employees]
    SELECT ' Test 13' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #13 - Verify No_NBS_Chars() where [last_name] has no Non-Breaking-Spaces (CHAR-160) in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             ,  CASE WHEN POSITION(CHR(160) IN last_name) > 0 THEN 'REJ-01: Field last_name has a Non-Breaking-Space (CHR-160)|exp=none|act=at position ' || CAST(POSITION(CHR(160) IN last_name) AS VARCHAR(4))
		             ELSE 'P' 
		       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 14 - Verify No_EmDash_Chars() where [last_name] has an EmDash character (CHAR-151...common Microsoft Word "--" conversion causing data load issues) in table [employees]
    SELECT ' Test 14' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #14 - Verify No_EmDash_Chars() where [last_name] has an EmDash character (CHAR-151...common Microsoft Word "--" conversion causing data load issues) in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN POSITION(CHR(151) IN last_name) > 0 THEN 'REJ-01: Field last_name has a Non-Breaking-Space (CHR-151)|exp=none|act=at position ' || CAST(POSITION(CHR(151) IN last_name) AS VARCHAR(4))
		            ELSE 'P'
		       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 15 - Verify No_VTFFNEL_Chars() where [last_name] has Vertical Tabs (CHAR-11), Form Feeds (CHAR-12) or Next Lines (CHAR-133) in table [employees]
    SELECT ' Test 15' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #15 - Verify No_VTFFNEL_Chars() where [last_name] has Vertical Tabs (CHAR-11), Form Feeds (CHAR-12) or Next Lines (CHAR-133) in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN POSITION(CHR(11) IN last_name) > 0  THEN 'REJ-01: Field last_name has a Vertical Tab (CHR-11)|exp=none|act=at position ' || CAST(POSITION(CHR(11) IN last_name) AS VARCHAR(4))
	                WHEN POSITION(CHR(12) IN last_name) > 0  THEN 'REJ-02: Field last_name has a Form Feed (CHR-12)|exp=none|act=at position ' || CAST(POSITION(CHR(12) IN last_name) AS VARCHAR(4))
	                WHEN POSITION(CHR(133) IN last_name) > 0 THEN 'REJ-03: Field last_name has a Next Line (CHR-133)|exp=none|act=at position ' || CAST(POSITION(CHR(133) IN last_name) AS VARCHAR(4))
	                ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 16 - Verify No_PeriodDash_Chars() where [last_name] has periods or dashes in table [employees]
    SELECT ' Test 16' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #16 - Verify No_PeriodDash_Chars() where [last_name] has periods or dashes in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN POSITION('.' IN last_name) > 0 THEN 'REJ-01: Field last_name has a period|exp=none|act=at position ' || CAST(POSITION('.' IN last_name) AS VARCHAR(4))
	                WHEN POSITION('0' IN last_name) > 0 THEN 'REJ-02: Field last_name has a dash|exp=none|act=at position ' || CAST(POSITION('0' IN last_name) AS VARCHAR(4))
	                ELSE 'P'
		       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 17 - Verify NoBadChars() where [last_name] has no funky punctuation ",/:()&#?;" in table [employees]'
    SELECT ' Test 17' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #17 - Verify NoBadChars() where [last_name] has no funky punctuation ",/:()&#?;" in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN last_name ~ '[,/:()&#?;]' THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 18 - Verify OnlyAllowedChars() where [phone_number] only has characters ".0123456789" in table [employees]
    SELECT ' Test 18' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #18 - Verify OnlyAllowedChars() where [phone_number] only has characters ".0123456789" in table [employees]' AS tst_descr   
    FROM (
    	SELECT phone_number
             , CASE WHEN phone_number ~ '[^.0123456789]' THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';



--  Test 19 - Verify LikeWildcards() where [phone_number] contains a ''.'' and matches valid patterns in table [employees]
    SELECT ' Test 19' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #19 - Verify LikeWildcards() where [phone_number] contains a ''.'' and matches valid patterns in table [employees]' AS tst_descr   
    FROM (
    	SELECT phone_number
             , CASE WHEN phone_number NOT LIKE '%.%'                THEN 'REJ-01: Verify phone_number contains a ''.''|exp=contains-.|act=' || phone_number
                    WHEN phone_number NOT LIKE '___.___.____' 
                     AND phone_number NOT LIKE '011.__.____._____%' THEN 'REJ-02: Verify phone_number like pattern "___.___.____" or "011.__.____._____"|exp=yes|act=' || phone_number
    	            ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 20 - Verify IsNumeric() where [zip5] will convert to numeric in table [employees]
    SELECT ' Test 20' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #20 - Verify IsNumeric() where [zip5] will convert to numeric in table [employees]' AS tst_descr   
    FROM (
    	SELECT zip5
             , CASE WHEN NOT zip5 ~ '^\d+(\.\d+)?$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 21 - Verify IsDate("yyyymmdd") where [some_date_fmt1] has date fmt="yyyymmd" in table [employees]
    SELECT ' Test 21' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #21 - Verify IsDate("yyyymmdd") where [some_date_fmt1] has date fmt="yyyymmd" in table [employees]' AS tst_descr   
    FROM (
    	SELECT some_date_fmt1
             , CASE WHEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
                        some_date_fmt1,'0',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9','')
                        > ''                                                         THEN 'REJ-01: Unexpected chars exist (numeric 0-9 only)|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                    WHEN NOT LENGTH(TRIM(some_date_fmt1)) = 8                        THEN 'REJ-02: Must be 8 Chars|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                    WHEN NOT SUBSTRING(some_date_fmt1,1,4) BETWEEN '1753' AND '9999' THEN 'REJ-03: Year Not Btw 1753-9999|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                    WHEN NOT SUBSTRING(some_date_fmt1,5,2) BETWEEN '01' AND '12'     THEN 'REJ-04: Month Not Btw 01-12|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                    WHEN NOT SUBSTRING(some_date_fmt1,7,2) BETWEEN '01' AND '31'     THEN 'REJ-05: Day Not Btw 01-31|exp=Fmt="yyyymmdd"|act=' || some_date_fmt1
                    ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 22 - Verify IsDate("mm/dd/yyyy") where [some_date_fmt2] has date fmt="mm/dd/yyyy" in table [employees]
    SELECT ' Test 22' AS tst_id
         , '"RS-6 Text" #22 - Verify IsDate("mm/dd/yyyy") where [some_date_fmt2] has date fmt="mm/dd/yyyy" in table [employees]' AS tst_descr   
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
    FROM (
    	SELECT some_date_fmt2
             , CASE WHEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
                         some_date_fmt2,'0',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9',''),'/','')
                         > ''                                                       THEN 'REJ-01: Unexpected Chars Exist|exp=Fmt="mm/dd/yyyy"|act=' || some_date_fmt2
                   WHEN NOT LENGTH(TRIM(some_date_fmt2)) = 10                       THEN 'REJ-02: Must be 10 Chars|exp=Fmt="mm/dd/yyyy"|act=' || some_date_fmt2
                   WHEN NOT SUBSTRING(some_date_fmt2,7,4) BETWEEN '1753' AND '9999' THEN 'REJ-03: Year Not Btw 1753-9999|exp=Fmt="mm/dd/yyyy"|act=' || some_date_fmt2
                   WHEN NOT SUBSTRING(some_date_fmt2,1,2) BETWEEN '01' AND '12'     THEN 'REJ-04: Month Not Btw 01-12|exp=Fmt="mm/dd/yyyy"|act=' || some_date_fmt2
                   WHEN NOT SUBSTRING(some_date_fmt2,4,2) BETWEEN '01' AND '31'     THEN 'REJ-05: Day Not Btw 01-31|exp=Fmt="mm/dd/yyyy"|act=' || some_date_fmt2
                   ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 23 - Verify IsDate("mm-dd-yyyy") where [some_date_fmt3] has date fmt="mm-dd-yyyy" in table [employees]
    SELECT ' Test 23' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #23 - Verify IsDate("mm-dd-yyyy") where [some_date_fmt3] has date fmt="mm-dd-yyyy" in table [employees]' AS tst_descr   
    FROM (
    	SELECT some_date_fmt3
             , CASE WHEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
                         some_date_fmt3,'0',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9',''),'-','')
                         > ''                                                       THEN 'REJ-01: Unexpected Chars Exist|exp=Fmt="mm-dd-yyyy"|act=' || some_date_fmt3
                   WHEN NOT LENGTH(TRIM(some_date_fmt3)) = 10                       THEN 'REJ-02: Must be 10 Chars|exp=Fmt="mm-dd-yyyy"|act=' || some_date_fmt3
                   WHEN NOT SUBSTRING(some_date_fmt3,7,4) BETWEEN '1753' AND '9999' THEN 'REJ-03: Year Not Btw 1753-9999|exp=Fmt="mm-dd-yyyy"|act=' || some_date_fmt3
                   WHEN NOT SUBSTRING(some_date_fmt3,1,2) BETWEEN '01' AND '12'     THEN 'REJ-04: Month Not Btw 01-12|exp=Fmt="mm-dd-yyyy"|act=' || some_date_fmt3
                   WHEN NOT SUBSTRING(some_date_fmt3,4,2) BETWEEN '01' AND '31'     THEN 'REJ-05: Day Not Btw 01-31|exp=Fmt="mm-dd-yyyy"|act=' || some_date_fmt3
                   ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 24 - Verify IsDate("yyyy-mm-dd") where [some_date_fmt4] has date fmt="yyyy-mm-dd" in table [employees]
    SELECT ' Test 24' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-6 Text" #24 - Verify IsDate("yyyy-mm-dd") where [some_date_fmt4] has date fmt="yyyy-mm-dd" in table [employees]' AS tst_descr   
    FROM (
    	SELECT some_date_fmt4
             , CASE WHEN REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
                        some_date_fmt4,'0',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9',''),'-','')
                        > ''                                                        THEN 'REJ-01: Unexpected Chars Exist|exp=Fmt="yyyy-mm-dd"|act=' || some_date_fmt4
                   WHEN NOT LENGTH(TRIM(some_date_fmt4)) = 10                       THEN 'REJ-02: Must be 10 Chars|exp=Fmt="yyyy-mm-dd"|act=' || some_date_fmt4
                   WHEN NOT SUBSTRING(some_date_fmt4,1,4) BETWEEN '1753' AND '9999' THEN 'REJ-03: Year Not Btw 1753-9999|exp=Fmt="yyyy-mm-dd"|act=' || some_date_fmt4
                   WHEN NOT SUBSTRING(some_date_fmt4,6,2) BETWEEN '01' AND '12'     THEN 'REJ-04: Month Not Btw 01-12|exp=Fmt="yyyy-mm-dd"|act=' || some_date_fmt4
                   WHEN NOT SUBSTRING(some_date_fmt4,9,2) BETWEEN '01' AND '31'     THEN 'REJ-05: Day Not Btw 01-31|exp=Fmt="yyyy-mm-dd"|act=' || some_date_fmt4
                   ELSE 'P'
    	       END AS status
    	FROM demo_data.employees
    ) t
    WHERE status <> 'P';

