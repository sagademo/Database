CREATE TABLE [mst].[Tran_Master_TG_Details] (
    [TrainergrantId] INT            NULL,
    [TrainergrantNo] NVARCHAR (20)  NOT NULL,
    [DesignationId]  TINYINT        NOT NULL,
    [DivisionId]     INT            NOT NULL,
    [SectionId]      INT            NOT NULL,
    [TradeId]        INT            NOT NULL,
    [AdminId]        INT            NULL,
    [UserId]         INT            NULL,
    [Year]           DATETIME       NOT NULL,
    [Description]    NVARCHAR (MAX) NOT NULL,
    [InstituteId]    INT            NULL,
    FOREIGN KEY ([AdminId]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([DesignationId]) REFERENCES [mst].[Master_Designation] ([DesignationId]),
    FOREIGN KEY ([DivisionId]) REFERENCES [mst].[Master_Division] ([DivisionId]),
    FOREIGN KEY ([InstituteId]) REFERENCES [mst].[Master_Institute] ([InstituteId]),
    FOREIGN KEY ([SectionId]) REFERENCES [mst].[Master_Createsection] ([SectionId]),
    FOREIGN KEY ([TrainergrantId]) REFERENCES [mst].[Master_TG_Details] ([TrainergrantId]),
    FOREIGN KEY ([UserId]) REFERENCES [mst].[Master_Usercreation] ([UserId])
);

