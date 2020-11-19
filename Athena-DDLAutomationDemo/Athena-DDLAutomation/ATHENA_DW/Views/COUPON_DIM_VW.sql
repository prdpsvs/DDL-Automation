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