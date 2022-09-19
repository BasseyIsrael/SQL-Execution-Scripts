USE msdb;
GO

/******  
This script can be used to add a new operator to your SQL Database. BE careful with this script as
operator privilages can likely permanently or temporarily alter the Database structure and content.
******/


IF NOT EXISTS (SELECT name FROM msdb.dbo.sysoperators WHERE name = N'Add Operator Name')
EXEC msdb.dbo.sp_add_operator 
    @name=N'Add Operator Name', 
    @enabled=1, 
    @weekday_pager_start_time=90000, 
    @weekday_pager_end_time=180000, 
    @saturday_pager_start_time=90000, 
    @saturday_pager_end_time=180000, 
    @sunday_pager_start_time=90000, 
    @sunday_pager_end_time=180000, 
    @pager_days=0, 
    @email_address=N'abcd@domainname.com', 
    @category_name=N'[Uncategorized]'
GO

USE msdb;
GO

EXEC master.dbo.sp_MSsetalertinfo @failsafeoperator=N'Add Operator Name'
GO

USE msdb;
GO

EXEC msdb.dbo.sp_set_sqlagent_properties @email_save_in_sent_folder=1
GO

IF  EXISTS (SELECT name FROM msdb.dbo.sysoperators WHERE name = N'CI DBA Alerts')
EXEC msdb.dbo.sp_delete_operator @name=N'CI DBA Alerts'
GO