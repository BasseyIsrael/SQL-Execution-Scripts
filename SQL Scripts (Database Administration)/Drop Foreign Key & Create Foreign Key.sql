--Simple script to drop foreign keys from database

USE INPUT_DATABASE_NAME 
SET NOCOUNT ON;

DECLARE @MaxFKid INT,
		@Str NVARCHAR(1024);

SELECT	@MaxFKid = MAX(FKid)
FROM	dbo.FKDrop;

WHILE	@MaxFKid > 0
	BEGIN
		SELECT	@Str = '';
		SELECT	@Str = [Str]
		FROM	dbo.FKDrop
		WHERE	FKid = @MaxFKid;

		PRINT	@Str;
		
		EXEC sp_executesql @stmt = @Str;
		
		SELECT	@MaxFKid = @MaxFKid - 1;
	END


--Simple script to recreate foreign keys constraints in database
USE INPUT_DATABASE_NAME
SET NOCOUNT ON;

DECLARE @MaxFKid INT,
		@Str NVARCHAR(1024);

SELECT	@MaxFKid = MAX(FKid)
FROM	dbo.FKCreate;

WHILE	@MaxFKid > 0
	BEGIN
		SELECT	@Str = '';
		SELECT	@Str = [Str]
		FROM	dbo.FKCreate
		WHERE	FKid = @MaxFKid;

		PRINT	@Str;

		EXEC sp_executesql @stmt = @Str;
		
		SELECT	@MaxFKid = @MaxFKid - 1;

	END