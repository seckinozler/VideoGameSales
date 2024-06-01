-- Deleting 271 rows with null values in year column from the database
BEGIN TRAN
DELETE
FROM vgsales
WHERE year IS NULL
ROLLBACK TRAN

-- Global Numbers
-- Global Sale Numbers
SELECT 
	SUM(global_sales) AS TotalGlobalSales,
	SUM(na_sales) AS TotalNASales,
	SUM(eu_sales) AS TotalEuSales,
	SUM(jp_sales) AS TotalJpSales,
	SUM(other_sales) AS TotalOtherSales
FROM vgsales

--Total Video Games Sales in Genres Per Year
SELECT 
	year,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales,
	genre
FROM vgsales
GROUP BY year, genre
ORDER BY TotalGlobalSales DESC


-- Sale Numbers Per Platform
SELECT 
	Platform,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY Platform
ORDER BY TotalGlobalSales DESC

-- Sale Numbers Per Year
SELECT 
	year,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY year
ORDER BY TotalGlobalSales DESC

-- Sale Numbers Per Genre
SELECT 
	genre,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY genre
ORDER BY TotalGlobalSales DESC

--- Sale Numbers Per Publisher
SELECT 
	publisher,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY publisher
ORDER BY TotalGlobalSales DESC

-- Avg Video Game Sales Per Year
SELECT 
	SUM(global_sales) / COUNT(DISTINCT year) AS AvgVgSalesPerYear
FROM vgsales
WHERE year > 1996 AND year < 2017

--Top 5 Sales by Genre
SELECT TOP 5 
	genre,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY genre
ORDER BY TotalGlobalSales DESC

--Bottom 5 Sales by Genre
SELECT TOP 5
	genre,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY genre
ORDER BY TotalGlobalSales ASC

--Top 5 Sales by Publisher
SELECT TOP 5 
	publisher,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY publisher
ORDER BY TotalGlobalSales DESC

--Bottom 5 Sales by Publisher
SELECT TOP 5 
	publisher,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY publisher
ORDER BY TotalGlobalSales ASC

--Top 5 Sales by Year
SELECT TOP 5 
	year,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
GROUP BY year
ORDER BY TotalGlobalSales DESC

--Bottom 5 Sales by Year
SELECT TOP 5 
	year,
	ROUND(SUM(global_sales),2) AS TotalGlobalSales
FROM vgsales
WHERE Year < 2017
GROUP BY year
ORDER BY TotalGlobalSales ASC

--Top 5 Sales by Game
SELECT TOP 5
	name,
	ROUND(Global_Sales,2) AS TotalGlobalSales
FROM vgsales
ORDER BY Global_Sales DESC

--Bottom 5 Sales by Game
SELECT TOP 5
	name,
	ROUND(Global_Sales,2) AS TotalGlobalSales
FROM vgsales
ORDER BY Global_Sales ASC