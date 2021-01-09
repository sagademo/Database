CREATE TABLE [dbo].[Master_Town] (
    [TownId]       INT           NOT NULL,
    [DistrictCode] INT           NOT NULL,
    [TalukCode]    INT           NOT NULL,
    [Town_EN]      NVARCHAR (50) NULL,
    [Town_KN]      NCHAR (10)    NULL,
    CONSTRAINT [PK_dbo.Master_Town] PRIMARY KEY CLUSTERED ([TownId] ASC, [DistrictCode] ASC, [TalukCode] ASC) WITH (FILLFACTOR = 90)
);

