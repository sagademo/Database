CREATE TABLE [mst].[Transaction_Master_TypeOfpurchase] (
    [TransactionId]  INT            IDENTITY (1, 1) NOT NULL,
    [PurchaseId]     TINYINT        NULL,
    [TypeOfpurchase] NVARCHAR (100) NOT NULL,
    [CreatedOn]      DATETIME       NULL,
    [CreatedBy]      INT            NULL,
    [UpdatedOn]      DATETIME       NULL,
    [UpdatedBy]      INT            NULL,
    PRIMARY KEY CLUSTERED ([TransactionId] ASC),
    FOREIGN KEY ([PurchaseId]) REFERENCES [mst].[Master_Typeofpurchase] ([PurchaseID])
);

