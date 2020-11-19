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
GO