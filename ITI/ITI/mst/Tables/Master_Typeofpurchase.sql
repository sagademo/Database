CREATE TABLE [mst].[Master_Typeofpurchase] (
    [PurchaseID]     TINYINT        IDENTITY (1, 1) NOT NULL,
    [TypeOfpurchase] NVARCHAR (100) NOT NULL,
    [CreatedOn]      DATETIME       NOT NULL,
    [CreatedBy]      INT            NULL,
    [UpdatedOn]      DATETIME       NULL,
    [UpdatedBy]      INT            NULL,
    PRIMARY KEY CLUSTERED ([PurchaseID] ASC),
    FOREIGN KEY ([CreatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([UpdatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId])
);

