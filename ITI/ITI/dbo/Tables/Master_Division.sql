CREATE TABLE [dbo].[Master_Division] (
    [DivisionId]   INT            NOT NULL,
    [LanguageId]   INT            NOT NULL,
    [DivisionName] NVARCHAR (100) NULL,
    [Active]       CHAR (1)       NULL,
    CONSTRAINT [PK_Master_Division2] PRIMARY KEY CLUSTERED ([DivisionId] ASC, [LanguageId] ASC) WITH (FILLFACTOR = 90)
);

