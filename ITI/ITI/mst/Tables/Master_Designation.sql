CREATE TABLE [mst].[Master_Designation] (
    [DesignationId] TINYINT        IDENTITY (1, 1) NOT NULL,
    [Designation]   NVARCHAR (100) NOT NULL,
    [CreatedOn]     DATETIME       NOT NULL,
    [CreatedBy]     INT            NULL,
    [UpdatedOn]     DATETIME       NULL,
    [UpdatedBy]     INT            NULL,
    PRIMARY KEY CLUSTERED ([DesignationId] ASC),
    FOREIGN KEY ([CreatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([UpdatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId])
);

