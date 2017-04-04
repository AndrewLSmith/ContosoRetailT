CREATE PROCEDURE dbo.UpdateAccountDetails
	@AccountKey int,
	@AccountName nvarchar(50) = NULL,
	@AccountDescription nvarchar(50) = NULL,
	@AccountType nvarchar(50) = NULL	
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.DimAccount SET AccountName = COALESCE(@AccountName, AccountName), 
							  AccountDescription = COALESCE(@AccountDescription, AccountDescription),
							  AccountType = COALESCE(@AccountType, AccountType)
						  WHERE AccountKey = @AccountKey
						  AND (@AccountName IS NOT NULL OR
							   @AccountDescription IS NOT NULL OR
							   @AccountType IS NOT NULL);


END
