CREATE PROCEDURE testContoso.[test accounts table updates]
AS
BEGIN

--ARRANGE
EXEC tSQLt.FakeTable 'dbo.DimAccount';

INSERT INTO dbo.DimAccount
(
	AccountKey,
	AccountName,
	AccountDescription,
	AccountType
)
VALUES
	(1, 'Income', 'General Income', 'Income'),
	(2, 'Expense', 'General Expenses', 'Expense'),
	(3, 'Revenue', 'General Revenue', 'Income'),
	(4, 'IT Costs', 'Costs', 'Expense');

CREATE TABLE #Expected
(
	AccountKey			int not null,
	AccountName			nvarchar(50) COLLATE database_default not null,
	AccountDescription	nvarchar(50) COLLATE database_default not null,
	AccountType			nvarchar(50) COLLATE database_default not null
);

DECLARE @NewAccountKey int = 4;
DECLARE @NewAccountName nvarchar(50) = 'IT Costs';
DECLARE @NewAccountDescr nvarchar(50) = 'Costs for IT only';
DECLARE @NewAccountType nvarchar(50) = 'Expense';

INSERT INTO #Expected (AccountKey, AccountName, AccountDescription, AccountType)
SELECT AccountKey, AccountName, AccountDescription, AccountType
FROM dbo.DimAccount
WHERE AccountKey IN (1, 2, 3)
UNION ALL
SELECT @NewAccountKey, @NewAccountName, @NewAccountDescr, @NewAccountType;

--ACT
EXEC dbo.UpdateAccountDetails @NewAccountKey, NULL, 'Blah', NULL;

--ASSERT
SELECT AccountKey, AccountName, AccountDescription, AccountType
INTO #Actual	
FROM dbo.DimAccount

EXEC tSQLt.AssertEqualsTable '#Expected', '#Actual';

END
