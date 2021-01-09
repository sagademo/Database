CREATE TABLE [dbo].[Master_District] (
    [DistrictCode]     INT           NOT NULL,
    [DistrictName]     NVARCHAR (50) NULL,
    [LanguageId]       INT           NOT NULL,
    [Active]           CHAR (1)      NULL,
    [census_dist_code] INT           NULL,
    [Divisionid]       INT           NULL
);

