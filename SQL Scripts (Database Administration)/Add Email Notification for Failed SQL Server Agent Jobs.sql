/*
Create direct email notifications for failed jobs with SQL script.
Here an easy way to setup alerts for all sql agent jobs. 
In this case, it is advisable to use group email address rather than individuals to make this a one-time setup.
*/

USE msdb;
GO
--create a DBA Team operator
EXEC msdb.dbo.sp_add_operator 
        @name=N'Operator to be notified', 
		@enabled=1, 
		@email_address=N'administrator@yourdomain.com' 
GO

--add notifications for failure to all jobs
DECLARE @QuotedIdentifier char(1); SET @QuotedIdentifier = '' -- use '''' for single quote
DECLARE @ListDelimeter char(1); SET @ListDelimeter = ';'
DECLARE @CSVlist varchar(max) 
 
--no event log, email on failure
SELECT	@CSVlist = COALESCE(@CSVlist + @ListDelimeter, '') + @QuotedIdentifier + 
'
EXEC msdb.dbo.sp_update_job @job_id=N'''
+ convert(varchar(max),[job_id]) +
''', 
		@notify_level_eventlog=0,
		@notify_level_email=2, 
		@notify_email_operator_name=N''DBA Team''' -- Change this to the operator you need to be notified.
 + @QuotedIdentifier
from msdb.dbo.sysjobs
 
print @csvlist
GO