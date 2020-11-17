INSERT INTO [ATHENA_DW].[BI_ITEM_GROUP]
           ([USER_NAME]
           ,[ITEM_GROUP_CODE]
           ,[ITEM_NUM]
           ,[COMPANY_NUM]
           ,[ITEM_GROUP_DESC]
           ,[COMPANY_CODE]
           ,[COMPANY_NAME]
           ,[CREATE_AUDIT_ID]
           ,[CREATE_DB_TIMESTAMP])
     VALUES
           ('ITEMGRP'
           ,'CG1'
           ,1
           ,1
           ,'CG1'
           ,'C1'
           ,'Costco'
           ,1234
           ,'2020-11-17')
GO


