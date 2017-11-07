USE [Database]
GO


CREATE PROCEDURE [dbo].[SP_SearchDatabase] (@what varchar(255)) AS 


	SELECT Name as FoundName, Type_Desc as FoundObject, Name as ParentObject, type_desc as ParentType, Create_Date
	FROM sys.procedures
	WHERE OBJECT_DEFINITION(OBJECT_ID) LIKE '%' +  @what + '%'

	UNION

	SELECT o.name AS FoundName, Type_Desc AS FoundObject, o.name AS ParentObject, type_desc as ParentType, Create_Date 
	FROM sys.all_objects o
	WHERE name LIKE '%' +  @what + '%'

	UNION

	SELECT c.name as FoundName, 'COLUMN' As FoundObject, o.name AS ParentObject, type_desc as ParentType, Create_Date 
	FROM sys.all_objects o
	INNER JOIN sys.all_columns c on o.object_id = c.object_id
	WHERE c.name LIKE '%' +  @what + '%'
