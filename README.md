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


## **Data Validation - Checking Numeric Values** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Data%20Reset.vb)


Handling Numeric values in a table present in a database is very key to querying and processing data. Different scripts for handling numeric values are presented here. Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify NoNulls() at a Column in a Table
- `Test 02` - Verify NotNegative() where values are less than 0 in a Table
- `Test 03` - Verify NumericRange() where column values lie between 100 and 999 in a table
- `Test 04` - Verify InValueList() where column is in list (1,2,3,4) in a table
- `Test 04` - Verify NotInValueList() where column value is not in list (97,98,99) in a table
- `Test 05` - Verify MultiFieldCompare() where column 1 x column 2 <= $10,000 cap in a table


## **Data Validation - Checking Regular Expressions** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/File%20Names.cls)

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


## **Data Validation - Checking Text Values** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Import%20or%20Copy%20Data.vb)






## **Data Validation - Counting Rows** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/List%20of%20WS.vb)


Options for counting rows are presented here. Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify FullRowCount() = 25 at a table column
- `Test 02` - Verify PartialRowCount() = 8 where column value = 1 (Europe) in corresponding table(s)
- `Test 03` - Verify RelativeRowCount() of column 1 row count >= 5x table column 2 row count
- `Test 04` - Verify RecentRowCount() >= 5 in specific column where update has occured in past


## **Data Validation - Handling Date Values** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Lookup%20Data.vb)


Set of scripts to be used in data validation for handling date values as presented in the tables in the database. Click on "View" to access the code. Feel free to modify it for your personal use.

-  `Test 01` - Verify NoNulls() where time column has no nulls in table [countries]
-  `Test 02` - Verify DateRange() where values in time column is not in the future nor too "old" in a table
-  `Test 03` - Verify NoTimePart() where date of hire has no time part (is "12:00:00") in a table
-  `Test 04` - Verify HasTimePart() where start time has time part (is not 12:00:00) in a table
- `Test 05` - Verify MultiFieldCompare() where start date must be < [end_date] in a table



## **Data Validation - Known Defect Checks** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Rename%20Worksheets.vb)


Set of scripts to be used in data validation for checking known defects with defects regression that come up over time in the database are presented here.  Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 02` - Verify ValueFrequencyThresholds()" for regional values (eg: value=1 for 28% to 36% of rows) in table
- `Test 03` - VerVerify NoNulls() at table column in table  for past 30 days
- `Test 04` - Verify NoNulls() at region column in table ignoring 3 known bad rows 
- `Test 05` - Verify dozens of checks in a single table scan pass against table for best performance
- `Test 06` - Reference configuration settings from a temporary lookup table



## **Data Validation - Schema Monitoring** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20and%20send%20email.vb)


--Set of scripts to be used in data validation for monitoring schemas present in the tables in the database are presented here.  Click on "View" to access the code. Feel free to modify it for your personal use.

- `Test 01` - Verify TableStructure("BySQL") by comparing snapshot in SQL code vs actual schema/structure for table
- `Test 02` - Verify TableData("BySQL") - Data should not change for table
- `Test 03` - Verify TableData("By2TableCompare") - Table data should exactly match



## **Data Validation - Threshold & Relativity Analysis** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20as%20CSV.vb)

Still working across multiple worksheets in a workbook, a script is provided to give the user the ability to save all the worksheets available in the workbook as separate csv files. A naming convention is also provided in the script to avoid the hassle of having to manually input the names of all the files as they are saved.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Data Validation - Working with Keys** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20as%20xlsx.vb)

Still working across multiple worksheets in a workbook, a script is provided to give the user the ability to save all the worksheets available in the workbook as separate csv files. A naming convention is also provided in the script to avoid the hassle of having to manually input the names of all the files as they are saved.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Query Scripts** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20File.vb)

With this script, one can quickly save a file in any specified file format/extension by the click of a button or an assigned shortcut. This script, though simple, has many applications including when building userforms or building dashboards in excel. This can also be extended to other Microsoft Apps that support VBA.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Remove Spaces and Colons from Dates** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Screen%20Settings.vb)


When working with dashboards, it is sometimes desirable to view the worksheet in fulll screen format to reduce distractions and provide real estate for analysis. Two sub-routines are provided here that help the user to toggle full screen in excel. With this, presentations using excel becomes way easier and more space is provided for analysis elements.
Click on "View" to access the code. Feel free to modify it for your personal use.

---


## **Add a New Database Operator.** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.



## **Add Alerts and Notifications.** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Check%20File%20Existence.vb)


This script provides the user the option to search through a folder to check if the filenames present in a worksheet range are present in teh folder. The code can be applied as a stand-alone to keep track of a personal library, or it can also be used on a larger scale for document control in an organizational setting. The script requires the user to input the folder directory to be scanned through. A function is also present in the script that outputs a true or false. This can be used in simple cases. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Add Email Notification for Failed SQL Server Agent Jobs.**[(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Check%20WS%20Existence.vb)


When working with large files with multiple worksheets, it's easy to lose track of a worksheet especially when all you want to do is to check if the worksheet is present in the workbook before moving on to a new workbook. This script helps the user to quickly scan through the worksheets in a given workbook to confirm the existence of a given worksheet. With this, file searching becomes way easier especially for large files. You can expand this code to achieve more, like opening the specific worksheet with just one line of code. Click on "View" to access the code. Feel free to modify it for your personal use.


## **Add Gmail as Database Main Account** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Data%20Reset.vb)


Following a data import from an external source, needs might arise to reset the data, clear contents and reload a new set of data especially when working with batch data or working on a template. Analysts may find this useful when building dashboards and there is need to reload data.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Add Linked Server** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/File%20Names.cls)


This script gives the user the option to obtain the list if files present in a folder based on a file type. The list obtained from the code is printed on an excel worksheet already specified. This is especially useful when managing a library (large scale or personal). Beyond the management of a library,m this code can also be applied in document control when creating a master list of documents when it is not provided by default by the document management system already in place.
Click on "View" to access the code. Feel free to modify it for your personal use.



## **Add User to Azure Database and Add Role Membership** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Import%20or%20Copy%20Data.vb)


This script gives the user the ability to import data from an external excel source. The script opens a file selection window where the source file can be selected and the data is copied to the new worksheet and pasted as values. A box is also needed for the filename to be printed to. The imported data can be used by ana analyst to perform a form of routine analysis on a template, or create dashboards when working woth batch data. A script is also provided to clear the imported data and it can be accessed [here](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Data%20Reset.vb).
Click on "View" to access the code. Feel free to modify it for your personal use.



## **Checking for Long Running Jobs** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/List%20of%20WS.vb)


A management technique for handling large files is provided with this script. Here, you can provide a list of all the worksheets present in a workbook. This is mostly applicable in an organizational context for reports logging and access management. The use of this script can help speed up the process of urgent reporting for multiple files.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Create Foreign Key Information** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Lookup%20Data.vb)


Here, a function is provided to perform lookup on data more easily than the excel builtin lookup functions. Arguments are provided in the function and they are easy to use. Use this custom function in your workbook or you can attach iit to a larger block of code as you would like to use it.  
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Create Transaction Log Table** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Database Integrity Check** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Rename%20Worksheets.vb)


This script helps one to rename all the worksheets in your workbook based on cell value. When there are several worksheets in a workbook, renaming all of them one after the other could become a herculean task. However, with the extreme likelihood that there is a uniformity in the cell header or a specific defining cell common to all the worksheets, this script can easily attach names to all the worksheets bases on those defining cell values. The code block is expandable to carry more functionalities.
Click on "View" to access the code. Feel free to modify it for your personal use.



## **Drop Foreign Key and Create Foreign Key** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20and%20send%20email.vb)

In this case, reporting and sending updates is optimized by giving a user the ability to automatically save a reporting sheet as a pdf file into a specified file location and sending an email to a specific recipient with the saved pdf file attached to the email on outlook. A use case of this script is when a routine update on a specific analysis is required by a manager or a set of staff. A window to select the folder is used in this case however, one can simply change the save folder to a constant folder path. A date cell is also advisable to have so it can be easy to track the files  that have been saved. In an organizational context, a cell containing the document number can be used in place of "current date" for the filename.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Drop Old Tables** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20as%20CSV.vb)

Still working across multiple worksheets in a workbook, a script is provided to give the user the ability to save all the worksheets available in the workbook as separate csv files. A naming convention is also provided in the script to avoid the hassle of having to manually input the names of all the files as they are saved.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Drop Statement Executed from Stored Table** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20as%20xlsx.vb)

Still working across multiple worksheets in a workbook, a script is provided to give the user the ability to save all the worksheets available in the workbook as separate csv files. A naming convention is also provided in the script to avoid the hassle of having to manually input the names of all the files as they are saved.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Find an ID Gap in a Table** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Save%20File.vb)

With this script, one can quickly save a file in any specified file format/extension by the click of a button or an assigned shortcut. This script, though simple, has many applications including when building userforms or building dashboards in excel. This can also be extended to other Microsoft Apps that support VBA.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Find Orphaned Users in Each User Database** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Screen%20Settings.vb)


When working with dashboards, it is sometimes desirable to view the worksheet in fulll screen format to reduce distractions and provide real estate for analysis. Two sub-routines are provided here that help the user to toggle full screen in excel. With this, presentations using excel becomes way easier and more space is provided for analysis elements.
Click on "View" to access the code. Feel free to modify it for your personal use.


## **Know when a Table is updated** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Obtain Server Role Membership** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Recreate Foreign Keys** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Remove SA Account** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Restore Database Backups** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.

## **Set Default Database** [(View)](https://github.com/BasseyIsrael/Excel-VBA-Scripts/blob/main/VBA%20Scripts/Select%20a%20file.vb)


You can upload files in excel or upload files when working with a userform. This script can be attached to other functionalities in excel to achieve tasks that involve interacting with other files. The script opens a folder directory and the file types that are accessible by the user can be defined in the script.
Click on "View" to access the code. Feel free to modify it for your personal use.