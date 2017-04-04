CREATE TABLE [dbo].[EmployeeErrors] (
    [ColumnName]       NVARCHAR (50)  NULL,
    [LineageID]        INT            NULL,
    [ErrorRow]         VARCHAR (MAX)  NULL,
    [ErrorCode]        INT            NULL,
    [ErrorDescription] NVARCHAR (250) NULL
);

