CREATE TABLE [mst].[Master_Division] (
    [InstituteId]  INT            NULL,
    [SectionId]    INT            NULL,
    [TradeId]      INT            NULL,
    [DivisionId]   INT            IDENTITY (1, 1) NOT NULL,
    [DivisionName] NVARCHAR (100) NOT NULL,
    [CreatedBy]    INT            NULL,
    [CreatedOn]    DATETIME       NOT NULL,
    [UpdatedBy]    INT            NULL,
    [UpdateOn]     DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([DivisionId] ASC),
    FOREIGN KEY ([CreatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([InstituteId]) REFERENCES [mst].[Master_Institute] ([InstituteId]),
    FOREIGN KEY ([SectionId]) REFERENCES [mst].[Master_Createsection] ([SectionId]),
    FOREIGN KEY ([UpdatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId])
);

