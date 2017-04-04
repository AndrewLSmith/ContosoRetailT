CREATE TABLE [dbo].[FactInventory] (
    [InventoryKey]        INT      IDENTITY (1, 1) NOT NULL,
    [DateKey]             DATETIME NOT NULL,
    [StoreKey]            INT      NOT NULL,
    [ProductKey]          INT      NOT NULL,
    [CurrencyKey]         INT      NOT NULL,
    [OnHandQuantity]      INT      NOT NULL,
    [OnOrderQuantity]     INT      NOT NULL,
    [SafetyStockQuantity] INT      NULL,
    [UnitCost]            MONEY    NOT NULL,
    [DaysInStock]         INT      NULL,
    [MinDayInStock]       INT      NULL,
    [MaxDayInStock]       INT      NULL,
    [Aging]               INT      NULL,
    [ETLLoadID]           INT      NULL,
    [LoadDate]            DATETIME NULL,
    [UpdateDate]          DATETIME NULL
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [ix_cci]
    ON [dbo].[FactInventory];

