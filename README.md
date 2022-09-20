<h1 align="center">
  <img src="SQL Banner.png" alt="SQL Scripts Banner" />
</h1>


<div align="center">

# **SQL Execution Scripts**

</div>

<div align="justify">

 This repository provides access to various SQL commands I have found useful in functions that require database querying, administration and data processing. All scripts presented here are in .sql format, the codes can be easily copied, formatted, and applied at any application you would find them useful. Comments are also present in the codes to aid understanding. If you would like to collaborate on a project involving SQL, you can contact me on israelbssy@gmail.com.


Please, feel free to contribute to the codes any way you can. Comment any script you would like for me to provide. Cheers!
 
</div>


<div align="center">

![GitHub last commit](https://img.shields.io/github/last-commit/BasseyIsrael/SQL-Execution-Scripts?style=for-the-badge)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/BasseyIsrael/SQL-Execution-Scripts/SQL%20Scripts%20(Database%20Administration)?label=DBA%20Scripts&style=for-the-badge)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/BasseyIsrael/SQL-Execution-Scripts/SQL%20Scripts%20(Database%20Querying)?color=red&label=DB%20Querying%20Scripts&style=for-the-badge)
![License](https://img.shields.io/github/license/BasseyIsrael/SQL-Execution-Scripts?style=for-the-badge)






# **Productivity is not about getting everything done, rather it is about getting things done effectively – Brianna Gray.**

</div>

## **Author**

- [Israel Bassey](https://github.com/BasseyIsrael)


The scripts contained in this repo are available in two folders: 
[Database administration](https://github.com/BasseyIsrael/SQL-Execution-Scripts/tree/main/SQL%20Scripts%20(Database%20Administration)), and [Database Querying](https://github.com/BasseyIsrael/SQL-Execution-Scripts/tree/main/SQL%20Scripts%20(Database%20Querying)). In this Readme, you can easily find which script fits your purpose, and apply as such, contribute if not available, or comment to ask for an unavailable script.

## **All Script Types Contained in Database Querying**

  - [Creating a Database](#creating-a-database-view)
  - [Create Tables in a Database](#create-tables-in-a-databaseview)
  - [Data Validation - Checking Numeric Values](#data-validation---checking-numeric-values-view)
  - [Data Validation - Checking Regular Expressions](#data-validation---checking-regular-expressions-view)
  - [Data Validation - Checking Text Values](#data-validation---checking-text-values-view)
  - [Data Validation - Counting Rows](#data-validation---counting-rows-view)
  - [Data Validation - Handling Date Values](#data-validation---handling-date-values-view)
  - [Data Validation - Known Defect Checks](#data-validation---known-defect-checks-view)
  - [Data Validation - Schema Monitoring](#data-validation---schema-monitoring-view)
  - [Data Validation - Threshold & Relativity Analysis](#data-validation---threshold--relativity-analysis-view)
  - [Data Validation - Working with Keys](#data-validation---working-with-keys-view)
  - [Query Scripts](#query-scripts-view)
  - [Remove Spaces and Colons from Dates](#remove-spaces-and-colons-from-dates-view)
 


## **All Scripts Contained in Database Administration**

  - [Add a New Database Operator](#add-a-new-database-operator-view)
  - [Add Alerts and Notifications](#add-alerts-and-notifications-view)
  - [Add Email Notification for Failed SQL Server Agent Jobs](#add-email-notification-for-failed-sql-server-agent-jobsview)
  - [Add Gmail as Database Main Account](#add-gmail-as-database-main-account-view)
  - [Add Linked Server](#add-linked-server-view)
  - [Add User to Azure Database and Add Role Membership](#add-user-to-azure-database-and-add-role-membership-view)
  - [Checking for Long Running Jobs](#checking-for-long-running-jobs-view)
  - [Create Foreign Key Information](#create-foreign-key-information-view)
  - [Create Transaction Log Table](#create-transaction-log-table-view)
  - [Database Integrity Check](#database-integrity-check-view)
  - [Drop Foreign Key and Create Foreign Key](#drop-foreign-key-and-create-foreign-key-view)
  - [Drop Old Tables](#drop-old-tables-view)
  - [Drop Statement Executed from Stored Table](#drop-statement-executed-from-stored-table-view)
  - [Find an ID Gap in a Table](#find-an-id-gap-in-a-table-view)
  - [Find Orphaned Users in Each User Database](#find-orphaned-users-in-each-user-database-view)
  - [Know when a Table is updated](#know-when-a-table-is-updated-view)
  - [Obtain Server Role Membership](#obtain-server-role-membership-view)
  - [Recreate Foreign Keys](#recreate-foreign-keys-view)
  - [Remove SA Account](#remove-sa-account-view)
  - [Restore Database Backups](#restore-database-backups-view)
  - [Set Default Database](#set-default-database-view)
  
===========================================================================

# **Explore Codes**




<div align='justify'>

## **Creating a Database.** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Create%20a%20Database.sql)


Following the aim of this repository, a simple database was created using  simple create script. The commands used give you ability to add comments to the database, and decide on the accessibility provided to the database with the GRANT command. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Create Tables in a Database.**[(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Create%20Tables%20in%20a%20Database.sql)


With the demo database created, tables to work with in the schema can be created. This is the use of this part of the repository. here, you can find scripts that can help you create tables in a database with the necessary constraints and data types. For this repo, 8 tables are presented. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Data Validation - Checking Numeric Values** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Checking%20Numeric%20Values.sql)


Handling Numeric values in a table present in a database is very key to querying and processing data. Different scripts for handling numeric values are presented here. Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify NoNulls() at a Column in a Table
- `Test 02` - Verify NotNegative() where values are less than 0 in a Table
- `Test 03` - Verify NumericRange() where column values lie between 100 and 999 in a table
- `Test 04` - Verify InValueList() where column is in list (1,2,3,4) in a table
- `Test 04` - Verify NotInValueList() where column value is not in list (97,98,99) in a table
- `Test 05` - Verify MultiFieldCompare() where column 1 x column 2 <= $10,000 cap in a table


## **Data Validation - Checking Regular Expressions** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Checking%20Regular%20Expressions.sql)

Work with character combinations easily with regular expressions when working with data. Different tests are presented here. Click on "View" to access the code. Feel free to modify it for your personal use.


- `Test 01` - Verify RegExp("IsPhoneNumber") where phone_number matches RegEx pattern "[0-9]{3}[-. ][0-9]{3}[-. ][0-9]{4}" in table column
- `Test 02` - Test 02 - Verify RegExp("IsSSN") where [fake_ssn] matches RegEx pattern "^[0-9]{3}-[0-9]{2}-[0-9]{4}$" in table column.
- `Test 03` - Verify RegExp("IsZip5") where [zip5] matches RegEx pattern "^[0-9]{5}$" in table column.
- `Test 04` - Verify RegExp("IsZip5or9") where [zip5or9] matches RegEx pattern "^[[:digit:]]{5}(-[[:digit:]]{4})?$" in table column.
- `Test 05` - Verify RegExp("IsZip9") where [zip9] matches RegEx pattern "^[[:digit:]]{5}[-/.][[:digit:]]{4}$" in table column.
- `Test 06` - Verify RegExp("OnlyText") where [last_name] matches RegEx pattern "^[a-zA-Z ]+$" in table column.
- `Test 07` - Verify RegExp("OnlyNumeric") where [zip5] matches RegEx pattern "^[0-9]+$" in table column.
- `Test 08` - Verify RegExp("NoLeadTrailSpaces") where [last_name] matches RegEx pattern "(^\s)|(\s$)" in table column
- `Test 09` - Verify RegExp("NoWhitespaces") where [job_id] matches RegEx pattern "(\s)+" in table column.
- `Test 10` - Verify RegExp("OnlyLowerCase") at 3rd and 4th chars of [first_name] matching RegEx pattern "^[a-z]+$" in table column.
- `Test 11` - Verify RegExp("OnlyUpperCase") where [email] matching RegEx pattern "^[A-Z]+$" in table column.
- `Test 12` - Verify RegExp("TitleCase") where [first_name] upper cases first letter second name too and matches RegEx pattern "(\s[A-Z]){1}" in table column.
- `Test 13` - Verify RegExp("EmailAddress") where [email_address] matches RegEx pattern "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$" in table column.
- `Test 14` - Test 14 - Verify RegExp("IsUrl") where [url] matches RegEx pattern "(http)(s)?(:\/\/)" in table column.


## **Data Validation - Checking Text Values** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Checking%20Text%20Values.sql)






## **Data Validation - Counting Rows** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Counting%20Rows.sql)


Options for counting rows are presented here. Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify FullRowCount() = 25 at a table column
- `Test 02` - Verify PartialRowCount() = 8 where column value = 1 (Europe) in corresponding table(s)
- `Test 03` - Verify RelativeRowCount() of column 1 row count >= 5x table column 2 row count
- `Test 04` - Verify RecentRowCount() >= 5 in specific column where update has occured in past


## **Data Validation - Handling Date Values** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Handling%20Date%20Values.sql)


Set of scripts to be used in data validation for handling date values as presented in the tables in the database. Click on "View" to access the code. Feel free to modify it for your personal use.

-  `Test 01` - Verify NoNulls() where time column has no nulls in table 
-  `Test 02` - Verify DateRange() where values in time column is not in the future nor too "old" in a table
-  `Test 03` - Verify NoTimePart() where date of hire has no time part (is "12:00:00") in a table
-  `Test 04` - Verify HasTimePart() where start time has time part (is not 12:00:00) in a table
- `Test 05` - Verify MultiFieldCompare() where start date must be < [end_date] in a table



## **Data Validation - Known Defect Checks** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Known%20Defect%20Checks.sql)


Set of scripts to be used in data validation for checking known defects with defects regression that come up over time in the database are presented here.  Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 02` - Verify ValueFrequencyThresholds()" for regional values (eg: value=1 for 28% to 36% of rows) in table
- `Test 03` - VerVerify NoNulls() at table column in table  for past 30 days
- `Test 04` - Verify NoNulls() at region column in table ignoring 3 known bad rows 
- `Test 05` - Verify dozens of checks in a single table scan pass against table for best performance
- `Test 06` - Reference configuration settings from a temporary lookup table



## **Data Validation - Schema Monitoring** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Schema%20Monitoring.sql)


Set of scripts to be used in data validation for monitoring schemas present in the tables in the database are presented here.  Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify TableStructure("BySQL") by comparing snapshot in SQL code vs actual schema/structure for table
- `Test 02` - Verify TableData("BySQL") - Data should not change for table
- `Test 03` - Verify TableData("By2TableCompare") - Table data should exactly match



## **Data Validation - Threshold & Relativity Analysis** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Threshold%20%26%20Relativity%20Analysis.sql)

Set of scripts to be used in data validation for defining thresholds as presented in the tables in the database are presented here.  Click on "View" to access the code. Feel free to modify it for your personal use.

-- `Test 01` - Verify NullRateThresholds() for specific columns (eg: columnX is NULL for < 5% of the data ) in table
-- `Test 02` - Verify ValueFrequencyThresholds()" for column values



## **Data Validation - Working with Keys** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Data%20Validation%20-%20Working%20with%20Keys.sql)

Set of scripts to be used in data validation for working with foreign keys in relation to parents as presented in the tables in the database are presented here.  Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify UkeyHasNoDups() for a unique key UKey in table
- `Test 02` - Verify FKeyChildNotOrphans() at child foreign key in table
- `Test 03` - Verify FKeyParentHasChildren() at parent foreign key in table for select data unit


## **Query Scripts** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Query%20Scripts.sql)

For simple queries on data, scripts are presented here. This section is regularly updated with reference to specific leetcode  solutions and relevant generic queries independent of field of application.

- `Query 01` - SQL Script to combine two tables [Table 1] and [Table 2]
- `Query 03` - SQL Script to obtain consecutive numbers in a column using LEAD and LAG Functions
- `Query 04` - SQL Script to define customers who never made an order, combining tables of the [Table 1] and [Table 2]
- `Query 05` - Find users with duplicate emails
- `Query 06` - Delete duplicate emails found in the table

## **Remove Spaces and Colons from Dates** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Querying)/Remove%20Spaces%20and%20Colons%20from%20Dates.sql)


Direct SQL script to remove spaces and colons contained in dates to ensure uniformity in date values
Click on "View" to access the code. Feel free to modify it for your personal use.

---

# Administrator Codes


## **Add a New Database Operator.** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Add%20a%20New%20Operator.sql)


This script can be used to add a new operator to your SQL Database. BE careful with this script as operator privilages can likely permanently or temporarily alter the Database structure and content.
Click on "View" to access the code. Feel free to modify it for your personal use.



## **Add Alerts and Notifications.** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Add%20Alerts.sql)


Add alerts and notifications to job activities in SQL Database. Apply this to get regular updates, useful especially when there are multiple operators in a Database Server, there is a supervisor, or for general accountability and logging. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Add Email Notification for Failed SQL Server Agent Jobs.**[(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Add%20Email%20Notification%20for%20Failed%20SQL%20Server%20Agent%20Jobs.sql)


Create direct email notifications for failed jobs with SQL script. Here an easy way to setup alerts for all sql agent jobs. In this case, it is advisable to use group email address rather than individuals to make this a one-time setup. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Add Gmail as Database Main Account** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Add%20Gmail%20as%20DB%20Main%20Account.sql)


Add gmail account as Profile's mail account for activities logging and monitoring purposes.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Add Linked Server** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Add%20Linked%20Server.sql)


Add Linked server passing the login used for Kerberos AUTH. Click on "View" to access the code. Feel free to modify it for your personal use.



## **Add User to Azure Database and Add Role Membership** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Add%20User%20to%20Azure%20DB%20and%20Add%20Role%20Membership.sql)

Apply this section to ass a user to Azure database and also include the personnel's role membership. It should be noted that for this script, database compatibility level must be 130 for string_split function to work otherwise adding the user to datbase role will fail.
Use ALTER DATABASE to change the compatibility level of the database. The new compatibility level setting for a database takes effect when a `USE <database>` command is issued, or a new login is processed with that database as the default database context. To view the current compatibility level of a database, 
query the compatibility_level column in the sys.databases catalog view.
Change connection to user database and replace the user name then list the database role(s) in a comma seperated list.
If creating a sql user with password set the `@Password` to a value, if it's a domain account set the `@Password` to null
Click on "View" to access the code. Feel free to modify it for your personal use.



## **Checking for Long Running Jobs** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Checking%20for%20Long%20Running%20Jobs.sql)


Check for long running jobs as Database Admin. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Create Foreign Key Information** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Create%20Foreign%20key%20Information.sql)


Create Foreign Key information and store information on a table. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Create Transaction Log Table** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Create%20Transaction%20Log%20Table.sql)


Monitoring transaction activities in a database is one of the key functionalities of an adminisrator. Use this script to create a transction log table to monitor transaction activities on database. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Database Integrity Check** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Database%20Integrity%20Check.sql)


Database integrity checks on user databases for purposes involving database maintenance. 
This can be a running script or a periodic manually operated process for your database. Click on "View" to access the code. Feel free to modify it for your personal use.



## **Drop Foreign Key and Create Foreign Key** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Drop%20Foreign%20Key%20%26%20Create%20Foreign%20Key.sql)

Simple script to drop foreign keys from database and to recreate foreign keys constraints in a database. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Drop Old Tables** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Drop%20Old%20Tables.sql)

Drop old tables existing in database following a specified period and use cases. Ensure that this script is properly monitored as dropping tables often leads to dangerous results in database administration. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Drop Statement Executed from Stored Table** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Drop%20Statement%20Executed%20from%20Stored%20Table.sql)

This job step specifically drops foreign key constraints to make data purging easier. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Find an ID Gap in a Table** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Find%20an%20ID%20Gap%20in%20a%20Table.sql)

WArrange a table in a database to find gaps in the IDs listed in the table using arrangment commands `(DENSE RANK, MIN, MAX, ORDER BY)`. 
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Find Orphaned Users in Each User Database** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/FInd%20Orphan%20Users%20in%20Each%20User%20Database.sql)


Script to discover orphaned database users linked to a/an SQL Server login. This is necessary for access control to a database following context and permission. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Know when a Table is updated** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Know%20When%20a%20Table%20is%20Updated.sql)


Obtain data containing previous updates made to a table including lookups, scans, seeks, and object information. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Obtain Server Role Membership** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Obtain%20Server%20Role%20Membership.sql)


Obtain Server role membership on SQL server by a Database Administrator. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Recreate Foreign Keys** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Recreate%20Foreign%20Keys.sql)


Following data purge, this script can be used to recreate foreign key constraints used in a database. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Remove SA Account** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Remove%20SA%20Account.sql)

Click on "View" to access the code. Feel free to modify it for your personal use.

## **Restore Database Backups** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Restore%20Database%20Backups.sql)


Restore previous backups created in a database, for database maintenance with admin rights. Click on "View" to access the code. Feel free to modify it for your personal use.

## **Set Default Database** [(View)](https://github.com/BasseyIsrael/SQL-Execution-Scripts/blob/main/SQL%20Scripts%20(Database%20Administration)/Set%20Default%20Database.sql)


Create default database and schema following login and user initialization. Click on "View" to access the code. Feel free to modify it for your personal use.
