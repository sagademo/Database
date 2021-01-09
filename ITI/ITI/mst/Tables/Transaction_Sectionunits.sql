CREATE TABLE [mst].[Transaction_Sectionunits] (
    [TransactionId] INT           IDENTITY (1, 1) NOT NULL,
    [InstituteId]   INT           NULL,
    [SectionId]     INT           NULL,
    [UnitId]        INT           NULL,
    [Unit]          NVARCHAR (30) NULL,
    [CreatedOn]     DATETIME      NULL,
    [CreatedBy]     INT           NULL,
    [UpdatedOn]     DATETIME      NULL,
    [UpdatedBy]     INT           NULL
);

