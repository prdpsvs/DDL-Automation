CREATE VIEW [ATHENA_DW].[CARRIER_DIM_VW]
AS SELECT CARRIER_ID                      
     , CARRIER_CODE                    
     , CARRIER_DESC 
     , CARRIER_XYZ
     , INFERRED_IND                    
     , INFERRED_RESOLVED_DATE          
     , CREATE_AUDIT_ID                 
     , CREATE_DB_TIMESTAMP             
     , UPDATE_AUDIT_ID                 
     , UPDATE_DB_TIMESTAMP             
  FROM ATHENA_DW.CARRIER_DIM;
  GO