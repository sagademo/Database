CREATE TABLE [dbo].[Master_Trade] (
    [RankSourceId]    INT            NOT NULL,
    [TradeId]         INT            NOT NULL,
    [TradeName]       NVARCHAR (150) NOT NULL,
    [TradeCode]       VARCHAR (10)   NULL,
    [CreatedBy]       VARCHAR (20)   NULL,
    [CreatedOn]       SMALLDATETIME  NULL,
    [UpdatedBy]       VARCHAR (20)   NULL,
    [UpdatedOn]       SMALLDATETIME  NULL,
    [MainTradeId]     INT            NULL,
    [TradeDuration]   INT            NULL,
    [AffiliationType] INT            NULL,
    [TradeCodeId]     VARCHAR (3)    NULL,
    CONSTRAINT [PK_Master_Trade] PRIMARY KEY CLUSTERED ([RankSourceId] ASC, [TradeId] ASC) WITH (FILLFACTOR = 90)
);

