CREATE TABLE [mst].[Transaction_Master_Division] (
    [TransactionId] INT            IDENTITY (1, 1) NOT NULL,
    [InstituteId]   INT            NULL,
    [SectionId]     INT            NULL,
    [TradeId]       INT            NULL,
    [DivisionId]    INT            NULL,
    [DivisionName]  NVARCHAR (100) NULL,
    [CreatedBy]     INT            NOT NULL,
    [CreatedOn]     DATETIME       NULL,
    [UpdatedBy]     INT            NULL,
    [UpdatedOn]     DATETIME       NULL,
    FOREIGN KEY ([CreatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([DivisionId]) REFERENCES [mst].[Master_Division] ([DivisionId]),
    FOREIGN KEY ([InstituteId]) REFERENCES [mst].[Master_Institute] ([InstituteId]),
    FOREIGN KEY ([SectionId]) REFERENCES [mst].[Master_Createsection] ([SectionId])
);

