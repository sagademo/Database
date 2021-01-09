CREATE TYPE [mst].[TblVarTg] AS TABLE (
    [TrainergrantNo] NVARCHAR (20)  NULL,
    [Year]           DATETIME       NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [DesignationId]  TINYINT        NULL,
    [DivisionId]     INT            NULL,
    [SectionId]      INT            NULL,
    [TradeId]        INT            NULL,
    [UserId]         INT            NULL,
    [AdminId]        NVARCHAR (50)  NULL,
    [InstituteId]    INT            NULL);

