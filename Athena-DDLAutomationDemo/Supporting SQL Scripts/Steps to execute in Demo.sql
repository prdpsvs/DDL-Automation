-- Create new database on Azure Portal

-- Check-in base scripts (3 tables and 3 views). Deploy tables and views using SQL Package with Azure DevOps
-- Insert data in three tables

-- Add a non-nullable columns 
-- CHANNEL_XYZ & CARRIER_CODE
--		Check-in Pre-DACPAC script
--		Make changes to tables DDL as well
--		Make changes to Views as well
-- Execute the pre-DACPAC script and deploy other changes.

-- Show the way how Pre or Post Deployment scripts can be used to run complex queries

-- Alter an existing column from SMALLINT to INTEGER
--		Alter [INFERRED_IND] TO INT in ATHENA_DW.COUPON_DW - Regular column
--		Alter [COMPANY_NUM] TO BIGINT in ATHENA_DW.COUPON_DW - Clustered Index column

-- Add ATHENA_DW.BI_ITEM_GROUP	
--		ALTER ITEM_NUM TO BIGINT in ATHENA_DW.BI_ITEM_GROUP	- Replicated Table with CCI

-- Show how to add additional objects such as Stored Procedures, Functions along DDL's
