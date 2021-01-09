CREATE TABLE [mst].[Transaction_Master_Designation] (
    [TransactionId] INT            IDENTITY (1, 1) NOT NULL,
    [DesignationId] TINYINT        NULL,
    [Designation]   NVARCHAR (100) NOT NULL,
    [CreatedOn]     DATETIME       NULL,
    [CreatedBy]     INT            NULL,
    [UpdatedOn]     DATETIME       NULL,
    [UpdatedBy]     INT            NULL,
    PRIMARY KEY CLUSTERED ([TransactionId] ASC),
    FOREIGN KEY ([DesignationId]) REFERENCES [mst].[Master_Designation] ([DesignationId])
);

