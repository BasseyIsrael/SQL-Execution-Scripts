--Set of scripts to be used in data validation for checking regular expressions as presented in the tables in the database.


--  Test 01 - Verify RegExp("IsPhoneNumber") where phone_number matches RegEx pattern "[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}" in table [employees]
    SELECT ' Test 01' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #01 - Verify RegExp("IsPhoneNumber") where phone_number matches RegEx pattern "[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}" in table [employees]' AS tst_descr   
    FROM (
        -- NOTE: Use RegEx pattern "^\+(\d+\s?)+$" for international phone numbers
        SELECT phone_number
             , CASE WHEN NOT phone_number ~ '[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 02 - Verify RegExp("IsSSN") where [fake_ssn] matches RegEx pattern "^[0-9]{3}-[0-9]{2}-[0-9]{4}$" in table [employees]
    SELECT ' Test 02' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #02 - Verify RegExp("IsSSN") where [fake_ssn] matches RegEx pattern "^[0-9]{3}-[0-9]{2}-[0-9]{4}$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT fake_ssn
             , CASE WHEN NOT fake_ssn ~ '^[0-9]{3}-[0-9]{2}-[0-9]{4}$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 03  - Verify RegExp("IsZip5") where [zip5] matches RegEx pattern "^[0-9]{5}$" in table [employees]
    SELECT ' Test 03' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #03 - Verify RegExp("IsZip5") where [zip5] matches RegEx pattern "^[0-9]{5}$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT zip5
             , CASE WHEN NOT zip5 ~ '^[0-9]{5}$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 04 - Verify RegExp("IsZip5or9") where [zip5or9] matches RegEx pattern "^[[:digit:]]{5}(-[[:digit:]]{4})?$" in table [employees]
    SELECT ' Test 04' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #04 - Verify RegExp("IsZip5or9") where [zip5or9] matches RegEx pattern "^[[:digit:]]{5}(-[[:digit:]]{4})?$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT zip5or9
             , CASE WHEN NOT zip5or9 ~ '^[[:digit:]]{5}(-[[:digit:]]{4})?$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 05 - Verify RegExp("IsZip9") where [zip9] matches RegEx pattern "^[[:digit:]]{5}[-/.][[:digit:]]{4}$" in table [employees]
    SELECT ' Test 05' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #05 - Verify RegExp("IsZip9") where [zip9] matches RegEx pattern "^[[:digit:]]{5}[-/.][[:digit:]]{4}$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT zip9
             , CASE WHEN NOT zip9 ~ '^[[:digit:]]{5}[-/.][[:digit:]]{4}$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 06 - Verify RegExp("OnlyText") where [last_name] matches RegEx pattern "^[a-zA-Z ]+$" in table [employees]
    SELECT ' Test 06' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #06 - Verify RegExp("OnlyText") where [last_name] matches RegEx pattern "^[a-zA-Z ]+$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN NOT last_name ~ '^[a-zA-Z ]+$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 07 - Verify RegExp("OnlyNumeric") where [zip5] matches RegEx pattern "^[0-9]+$" in table [employees]
    SELECT ' Test 07' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #07 - Verify RegExp("OnlyNumeric") where [zip5] matches RegEx pattern "^[0-9]+$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT zip5
             , CASE WHEN NOT zip5 ~ '^[0-9]+$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 08 - Verify RegExp("NoLeadTrailSpaces") where [last_name] matches RegEx pattern "(^\s)|(\s$)" in table [employees]
    SELECT ' Test 08' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #08 - Verify RegExp("NoLeadTrailSpaces") where [last_name] matches RegEx pattern "(^\s)|(\s$)" in table [employees]' AS tst_descr   
    FROM (
    	SELECT last_name
             , CASE WHEN last_name ~ '(^\s)|(\s$)' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 09 - Verify RegExp("NoWhitespaces") where [job_id] matches RegEx pattern "(\s)+" in table [employees]
    SELECT ' Test 09' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #09 - Verify RegExp("NoWhitespaces") where [job_id] matches RegEx pattern "(\s)+" in table [employees]' AS tst_descr   
    FROM (
    	SELECT job_id
             , CASE WHEN job_id ~ '(\s)+' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 10 - Verify RegExp("OnlyLowerCase") at 3rd and 4th chars of [first_name] matching RegEx pattern "^[a-z]+$" in table [employees]
    SELECT ' Test 10' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #10 - Verify RegExp("OnlyLowerCase") at 3rd and 4th chars of [first_name] matching RegEx pattern "^[a-z]+$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT first_name
             , CASE WHEN NOT SUBSTRING(first_name,3,2) ~ '^[a-z]+$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 11 - Verify RegExp("OnlyUpperCase") where [email] matching RegEx pattern "^[A-Z]+$" in table [employees]
    SELECT ' Test 11' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #11 - Verify RegExp("OnlyUpperCase") where [email] matching RegEx pattern "^[A-Z]+$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT email
             , CASE WHEN NOT SUBSTRING(email,3,2) ~ '^[A-Z]+$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 12 - Verify RegExp("TitleCase") where [first_name] upper cases first letter second name too and matches RegEx pattern "(\s[A-Z]){1}" in table [employees]
    SELECT ' Test 12' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #12 - Verify RegExp("TitleCase") where [first_name] upper cases first letter second name too and matches RegEx pattern "(\s[A-Z]){1}" in table [employees]' AS tst_descr   
    FROM (
    	SELECT first_name, SUBSTRING(first_name,1,1) AS first_letter
             , CASE WHEN NOT SUBSTRING(first_name,1,1) ~ '([A-Z])' THEN 'REJ-01: Field first_name first character not upper case|exp=Like"[A-Z]"|act=' || first_name 
                WHEN first_name NOT LIKE '% %'                     THEN 'allgood'  -- Only one word, so no space + first character to check for uppercase
	            WHEN NOT first_name ~ '(\s[A-Z]){1}'               THEN 'REJ-02: Field first_name failed RegExpression check|exp=Like"(\s[A-Z]){1}"|act=' || first_name 
	            ELSE 'P'
    	       END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 13 - Verify RegExp("EmailAddress") where [email_address] matches RegEx pattern "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" in table [employees]
    SELECT ' Test 13' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #13 - Verify RegExp("EmailAddress") where [email_address] matches RegEx pattern "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" in table [employees]' AS tst_descr   
    FROM (
    	SELECT email_address
             , CASE WHEN NOT email_address ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.employees
    ) t
    WHERE status <> 'P';


--  Test 14 - Verify RegExp("IsUrl") where [url] matches RegEx pattern "(http)(s)?(:\/\/)" in table [departments]
    SELECT ' Test 14' AS tst_id
         , CASE WHEN COUNT(*) > 0 THEN 'FAIL' ELSE 'P' END AS status
         , '"RS-7 RegEx" #14 - Verify RegExp("IsUrl") where [url] matches RegEx pattern "(http)(s)?(:\/\/)" in table [departments]' AS tst_descr   
    FROM (
    	SELECT url
             , CASE WHEN NOT url ~ '(http)(s)?(:\/\/)' THEN 'FAIL' ELSE 'P' END AS status
    	FROM  demo_data.departments
    ) t
    WHERE status <> 'P';