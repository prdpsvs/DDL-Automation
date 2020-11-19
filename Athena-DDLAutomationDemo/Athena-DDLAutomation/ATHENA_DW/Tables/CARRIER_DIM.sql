﻿CREATE TABLE [ATHENA_DW].[CARRIER_DIM]
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