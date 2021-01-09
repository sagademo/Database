CREATE TABLE [mst].[Master_Usercreation] (
    [UserId]        INT            IDENTITY (1, 1) NOT NULL,
    [UserName]      NVARCHAR (100) NOT NULL,
    [InstituteId]   INT            NULL,
    [SectionId]     INT            NULL,
    [TradeId]       INT            NULL,
    [MobileNo]      BIGINT         NOT NULL,
    [DesignationId] TINYINT        NULL,
    [DivisionId]    INT            NULL,
    [CreatedOn]     DATETIME       NOT NULL,
    [CreatedBy]     INT            NOT NULL,
    [UpdatedOn]     DATETIME       NULL,
    [UpdatedBy]     INT            NULL,
    PRIMARY KEY CLUSTERED ([UserId] ASC),
    FOREIGN KEY ([CreatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId]),
    FOREIGN KEY ([DesignationId]) REFERENCES [mst].[Master_Designation] ([DesignationId]),
    FOREIGN KEY ([DivisionId]) REFERENCES [mst].[Master_Division] ([DivisionId]),
    FOREIGN KEY ([InstituteId]) REFERENCES [mst].[Master_Institute] ([InstituteId]),
    FOREIGN KEY ([SectionId]) REFERENCES [mst].[Master_Createsection] ([SectionId]),
    FOREIGN KEY ([UpdatedBy]) REFERENCES [mst].[Master_Admin] ([AdminId])
);

