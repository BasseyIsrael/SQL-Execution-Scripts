-- Add gmail account as Profile's mail account fro activities

EXEC sys.sp_configure N'show advanced options',1
GO
reconfigure
GO

EXEC sys.sp_configure N'Database Mail XPs', N'1' 
GO
RECONFIGURE 
GO 

EXECUTE msdb.dbo.sysmail_add_profile_sp  
   @profile_name=N'Gmail Notification Account',  
   @description=N'Email Notifications using Gmail Account' 
GO 

EXECUTE msdb.dbo.sysmail_add_principalprofile_sp  
   @principal_name=N'guest',  
   @profile_name=N'Gmail Notification Account',  
   @is_default=1 
GO 


 ----- Set Personalizeed Email address and password
EXECUTE msdb.dbo.sysmail_add_account_sp    
   @account_name='Gmail Notifications', 
   @email_address='emailaddress@gmail.com', 
   @display_name='SQL Server Gmail Notifications',  
   @replyto_address='emailaddress@gmail.com',  
   @description='Email Address for sending Notifications using Gmail',  
   @mailserver_name='smtp.gmail.com', 
   @mailserver_type='SMTP', 
   @port=587, 
   @username='emailaddress@gmail.com', 
   @password = 'password',  
   @use_default_credentials=0, 
   @enable_ssl=1 
   
 EXECUTE msdb.dbo.sysmail_add_profileaccount_sp  
   @profile_name=N'Gmail Notification Account',  
   @account_name=N'Gmail Notifications',
   @sequence_number = 1 ; 
GO 