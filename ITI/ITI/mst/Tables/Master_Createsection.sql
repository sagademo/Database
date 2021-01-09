CREATE TABLE [mst].[Master_Createsection] (
    [SectionId]   INT            IDENTITY (1, 1) NOT NULL,
    [Section]     NVARCHAR (200) NULL,
    [AdminId]     INT            NULL,
    [instituteid] INT            NULL,
    PRIMARY KEY CLUSTERED ([SectionId] ASC),
    FOREIGN KEY ([AdminId]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([instituteid]) REFERENCES [mst].[Master_Institute] ([InstituteId])
);

