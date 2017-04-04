IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[tSQLt].[Run]')
AND TYPE IN (N'P', N'PC'))
BEGIN
   EXECUTE [tSQLt].[Run] 'testContoso'
END 
