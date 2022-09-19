
--Add Linked server passing the login used for Kerberos AUTH
USE master;
GO
IF NOT EXISTS (
			SELECT	1
			FROM	SYS.servers
			WHERE	name = 'Name'
			)
	BEGIN
		EXEC master.dbo.sp_addlinkedserver @server = N'SQLCLR07-P', @srvproduct=N'Server Product'
		EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'SQLCLR07-P', @locallogin = NULL , @useself = N'True'
	END
GO