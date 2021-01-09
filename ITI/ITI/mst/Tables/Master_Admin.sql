CREATE TABLE [mst].[Master_Admin] (
    [InstituteId] INT            NULL,
    [AdminId]     INT            IDENTITY (1, 1) NOT NULL,
    [AdminName]   NVARCHAR (50)  NOT NULL,
    [MobileNo]    BIGINT         NOT NULL,
    [FromDate]    DATETIME       NOT NULL,
    [ToDate]      DATETIME       NOT NULL,
    [password]    NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([AdminId] ASC),
    FOREIGN KEY ([InstituteId]) REFERENCES [mst].[Master_Institute] ([InstituteId])
);

