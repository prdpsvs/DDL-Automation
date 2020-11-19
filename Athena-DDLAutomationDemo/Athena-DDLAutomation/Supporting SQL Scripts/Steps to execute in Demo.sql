-- Create new database on Azure Portal

-- Check-in base scripts (3 tables and 3 views). Deploy tables and views using SQL Package with Azure DevOps

CREATE TABLE [ATHENA_DW].[COUPON_DIM]
(
	[COUPON_ID] [bigint] IDENTITY(10000000000,1) NOT NULL,
	[COUPON_NUM] [int] NOT NULL,
	[COMPANY_NUM] [int] NOT NULL,
	[COUPON_DESC] [varchar](270) NOT NULL,
	[COUPON_BARCODE_NUM] [decimal](15, 0) NOT NULL,
	[SOURCE_SYSTEM] [varchar](10) NOT NULL,
	[INFERRED_IND] [smallint] NOT NULL,
	[INFERRED_RESOLVED_DATE] [date] NULL,
	[CREATE_AUDIT_ID] [bigint] NOT NULL,
	[CREATE_DB_TIMESTAMP] [datetime2](6) NOT NULL,
	[UPDATE_AUDIT_ID] [bigint] NOT NULL,
	[UPDATE_DB_TIMESTAMP] [datetime2](6) NOT NULL,
 CONSTRAINT [CPNDIM_PK] PRIMARY KEY NONCLUSTERED 
	(
		[COUPON_ID] ASC
	) NOT ENFORCED ,
 CONSTRAINT [CPNDIM_UN] UNIQUE NONCLUSTERED 
	(
		[COUPON_NUM] ASC,
		[COMPANY_NUM] ASC
	) NOT ENFORCED 
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED INDEX
	(
		[COUPON_NUM] ASC,
		[COMPANY_NUM] ASC
	)
)
GO

ALTER TABLE [ATHENA_DW].[COUPON_DIM] ADD  DEFAULT ((0)) FOR [INFERRED_IND]
GO


CREATE TABLE [ATHENA_DW].[CHANNEL_DIM]
(
	[CHANNEL_ID] [bigint] NOT NULL,
	[CHANNEL_CODE] [varchar](10) NOT NULL,
	[CHANNEL_DESC] [varchar](60) NOT NULL,
	[CREATE_AUDIT_ID] [bigint] NOT NULL,
	[CREATE_DB_TIMESTAMP] [datetime2](6) NOT NULL,
	[UPDATE_AUDIT_ID] [bigint] NOT NULL,
	[UPDATE_DB_TIMESTAMP] [datetime2](6) NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED INDEX
	(
		[CHANNEL_CODE] ASC
	)
)
GO

CREATE TABLE [ATHENA_DW].[CARRIER_DIM]
(
	[CARRIER_ID] [bigint] IDENTITY(10000000000,1) NOT NULL,
	[CARRIER_CODE] [varchar](10) NOT NULL,
	[CARRIER_DESC] [varchar](60) NOT NULL,
	[INFERRED_IND] [smallint] NOT NULL,
	[INFERRED_RESOLVED_DATE] [date] NULL,
	[CREATE_AUDIT_ID] [bigint] NOT NULL,
	[CREATE_DB_TIMESTAMP] [datetime2](6) NOT NULL,
	[UPDATE_AUDIT_ID] [bigint] NOT NULL,
	[UPDATE_DB_TIMESTAMP] [datetime2](6) NOT NULL,
 CONSTRAINT [CARRDIM_PK] PRIMARY KEY NONCLUSTERED 
	(
		[CARRIER_ID] ASC
	) NOT ENFORCED ,
 CONSTRAINT [CARRDIM_UN] UNIQUE NONCLUSTERED 
	(
		[CARRIER_CODE] ASC
	) NOT ENFORCED 
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED INDEX
	(
		[CARRIER_CODE] ASC
	)
)
GO

ALTER TABLE [ATHENA_DW].[CARRIER_DIM] ADD  DEFAULT ((0)) FOR [INFERRED_IND]
GO

CREATE VIEW [ATHENA_DW].[CARRIER_DIM_VW]
AS SELECT CARRIER_ID                      
     , CARRIER_CODE                    
     , CARRIER_DESC                    
     , INFERRED_IND                    
     , INFERRED_RESOLVED_DATE          
     , CREATE_AUDIT_ID                 
     , CREATE_DB_TIMESTAMP             
     , UPDATE_AUDIT_ID                 
     , UPDATE_DB_TIMESTAMP             
  FROM ATHENA_DW.CARRIER_DIM;
  GO

CREATE VIEW [ATHENA_DW].[CHANNEL_DIM_VW]
AS SELECT CHANNEL_ID                      
     , CHANNEL_CODE                    
     , CHANNEL_DESC 
     , CREATE_AUDIT_ID                 
     , CREATE_DB_TIMESTAMP             
     , UPDATE_AUDIT_ID                 
     , UPDATE_DB_TIMESTAMP             
  FROM ATHENA_DW.CHANNEL_DIM;
GO
  CREATE VIEW [ATHENA_DW].[COUPON_DIM_VW]
AS SELECT COUPON_ID                       
     , COUPON_NUM                      
     , COMPANY_NUM                     
     , COUPON_DESC                     
     , COUPON_BARCODE_NUM              
     , SOURCE_SYSTEM                   
     , INFERRED_IND                    
     , INFERRED_RESOLVED_DATE          
     , CREATE_AUDIT_ID                 
     , CREATE_DB_TIMESTAMP             
     , UPDATE_AUDIT_ID                 
     , UPDATE_DB_TIMESTAMP             
  FROM ATHENA_DW.COUPON_DIM;
GO
-- Insert data in three tables

INSERT INTO [ATHENA_DW].[CARRIER_DIM]
           ([CARRIER_CODE]
           ,[CARRIER_DESC]
           ,[INFERRED_IND]
           ,[INFERRED_RESOLVED_DATE]
           ,[CREATE_AUDIT_ID]
           ,[CREATE_DB_TIMESTAMP]
           ,[UPDATE_AUDIT_ID]
           ,[UPDATE_DB_TIMESTAMP])
     VALUES
           ('CD1'
           ,'CD'
           ,1
           ,'2020-11-17'
           ,1
           ,'2020-11-17'
           ,1
           ,'2020-11-17')
GO

INSERT INTO [ATHENA_DW].[CHANNEL_DIM]
           ([CHANNEL_ID]
           ,[CHANNEL_CODE]
           ,[CHANNEL_DESC]
           ,[CREATE_AUDIT_ID]
           ,[CREATE_DB_TIMESTAMP]
           ,[UPDATE_AUDIT_ID]
           ,[UPDATE_DB_TIMESTAMP])
     VALUES
           (1
           ,'Channel 1'
           ,'Channel 1'
           ,1
           ,'2020-11-17'
           ,1
           ,'2020-11-17')
GO

INSERT INTO [ATHENA_DW].[COUPON_DIM]
           ([COUPON_NUM]
           ,[COMPANY_NUM]
           ,[COUPON_DESC]
           ,[COUPON_BARCODE_NUM]
           ,[SOURCE_SYSTEM]
           ,[INFERRED_IND]
           ,[INFERRED_RESOLVED_DATE]
           ,[CREATE_AUDIT_ID]
           ,[CREATE_DB_TIMESTAMP]
           ,[UPDATE_AUDIT_ID]
           ,[UPDATE_DB_TIMESTAMP])
     VALUES
           (1
           ,1
           ,'Coupon 1'
           ,147269
           ,'DB2'
           ,1
           ,'2020-11-17'
           ,1
           ,'2020-11-17'
           ,1
           ,'2020-11-17')
GO

-- Execute the pre-DACPAC script and deploy other changes.
-- Add a non-nullable column 
-- CHANNEL_XYZ
--		Check-in Pre-DACPAC script

-- Approach 1 - The issue is the column is added at the end of the table

--ALTER TABLE ATHENA_DW.CHANNEL_DIM ADD CHANNEL_XYZ VARCHAR(10) NULL
--UPDATE ATHENA_DW.CHANNEL_DIM SET CHANNEL_XYZ = 'ABC'
---- OR
---- ALTER TABLE ATHENA_DW.CHANNEL_DIM ADD CHANNEL_XYZ VARCHAR(10) NOT NULL DEFAULT 'ABC'
--GO
--ALTER TABLE ATHENA_DW.CHANNEL_DIM ALTER COLUMN CHANNEL_XYZ VARCHAR(10) NOT NULL
--GO

-- Approach 2 - Create a temporary table with new column

IF OBJECT_ID('ATHENA_DW.CHANNEL_DIM_NEW','U') IS NOT NULL 
	DROP TABLE ATHENA_DW.CHANNEL_DIM_NEW

CREATE TABLE ATHENA_DW.CHANNEL_DIM_NEW
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED INDEX
	(
		CHANNEL_CODE ASC
	)
) AS
SELECT CHANNEL_ID
      ,CHANNEL_CODE
      ,CHANNEL_DESC
	  , 0 AS CHANNEL_XYZ -- If this is a computed column or with IS NULL check, Add ALTER TABLE ATHENA_DW.CHANNEL_DIM ALTER COLUMN CHANNEL_XYZ INT NOT NULL
      ,CREATE_AUDIT_ID
      ,CREATE_DB_TIMESTAMP
      ,UPDATE_AUDIT_ID
      ,UPDATE_DB_TIMESTAMP
 FROM ATHENA_DW.CHANNEL_DIM 

RENAME OBJECT ATHENA_DW.CHANNEL_DIM TO CHANNEL_DIM_OLD;
RENAME OBJECT ATHENA_DW.CHANNEL_DIM_NEW TO CHANNEL_DIM;
DROP TABLE ATHENA_DW.CHANNEL_DIM_OLD;

--		Make changes to tables DDL as well

CREATE TABLE [ATHENA_DW].[CHANNEL_DIM]
(
	[CHANNEL_ID] [bigint] NOT NULL,
	[CHANNEL_CODE] [varchar](10) NOT NULL,
	[CHANNEL_DESC] [varchar](60) NOT NULL,
    [CHANNEL_XYZ] [int] NOT NULL,
	[CHANNEL_XYZ] [int] NOT NULL,
	[CREATE_AUDIT_ID] [bigint] NOT NULL,
	[CREATE_DB_TIMESTAMP] [datetime2](6) NOT NULL,
	[UPDATE_AUDIT_ID] [bigint] NOT NULL,
	[UPDATE_DB_TIMESTAMP] [datetime2](6) NOT NULL
)
WITH
(
	DISTRIBUTION = REPLICATE,
	CLUSTERED INDEX
	(
		[CHANNEL_CODE] ASC
	)
)
GO
--		Make changes to Views as well

CREATE VIEW [ATHENA_DW].[CHANNEL_DIM_VW]
AS SELECT CHANNEL_ID                      
     , CHANNEL_CODE                    
     , CHANNEL_DESC 
     , CHANNEL_XYZ
     , CREATE_AUDIT_ID                 
     , CREATE_DB_TIMESTAMP             
     , UPDATE_AUDIT_ID                 
     , UPDATE_DB_TIMESTAMP             
  FROM ATHENA_DW.CHANNEL_DIM;


-- Show the way how Pre or Post Deployment scripts can be used to run complex queries

-- Alter an existing column from SMALLINT to INTEGER
--		Alter [INFERRED_IND] TO INT in ATHENA_DW.COUPON_DW - Regular column
--		Alter [COMPANY_NUM] TO BIGINT in ATHENA_DW.COUPON_DW - Clustered Index column

-- Add ATHENA_DW.BI_ITEM_GROUP	
--		ALTER ITEM_NUM TO BIGINT in ATHENA_DW.BI_ITEM_GROUP	- Replicated Table with CCI

-- Show how to add additional objects such as Stored Procedures, Functions along DDL's
