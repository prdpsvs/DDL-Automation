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


