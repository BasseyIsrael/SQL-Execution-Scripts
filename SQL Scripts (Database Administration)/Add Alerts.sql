/*
Add alerts and notifications to job activities in SQL Database
*/

USE msdb;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name6',
    @message_id=0,
    @severity=16,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name6', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name7',
    @message_id=0,
    @severity=17,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name7', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name8',
    @message_id=0,
    @severity=18,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name8', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name9',
    @message_id=0,
    @severity=19,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name9', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name20',
    @message_id=0,
    @severity=20,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name20', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name21',
    @message_id=0,
    @severity=21,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name21', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name22',
    @message_id=0,
    @severity=22,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name22', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name23',
    @message_id=0,
    @severity=23,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name23', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name24',
    @message_id=0,
    @severity=24,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name24', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Add Alert Name25',
    @message_id=0,
    @severity=25,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000';
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Add Alert Name25', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Error Number 823',
    @message_id=823,
    @severity=0,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Error Number 823', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Error Number 824',
    @message_id=824,
    @severity=0,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Error Number 824', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO

EXEC msdb.dbo.sp_add_alert 
    @name=N'Error Number 825',
    @message_id=825,
    @severity=0,
    @enabled=1,
    @delay_between_responses=60,
    @include_event_description_in=1,
    @job_id=N'00000000-0000-0000-0000-000000000000'
GO

EXEC msdb.dbo.sp_add_notification 
    @alert_name=N'Error Number 825', 
    @operator_name=N'Add Operator Name', 
    @notification_method = 7;
GO