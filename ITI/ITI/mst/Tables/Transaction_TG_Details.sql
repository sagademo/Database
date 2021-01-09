CREATE TABLE [mst].[Transaction_TG_Details] (
    [TransactionId]  INT          IDENTITY (1, 1) NOT NULL,
    [TrainergrantId] INT          NULL,
    [TrainergrantNo] VARCHAR (15) NULL,
    [Year]           DATETIME     NULL,
    [DesignationId]  TINYINT      NULL,
    [UnitId]         INT          NULL,
    [UserId]         INT          NULL,
    [CreatedBy]      INT          NULL,
    [CreatedOn]      DATETIME     NULL,
    [UpdatedBy]      INT          NULL,
    [UpdatedOn]      DATETIME     NULL
);

