DROP TABLE IF EXISTS Zepto;

-- Creating Table

CREATE TABLE Zepto (
sku_id SERIAL PRIMARY KEY,
Category VARCHAR(120),
Name VARCHAR(150) NOT NULL,
Mrp NUMERIC(8,2),
Discount_Percent NUMERIC(5,2),
Available_Quantity INTEGER,
Selling_Price NUMERIC(8,2),
WeightInGms INTEGER,
Stock BOOLEAN,	
Quantity INTEGER
);

--Imported CSV file using pgAdmin4 GUI

--Checking Complete Data Imported or Not

SELECT COUNT(*) FROM Zepto;

--Check For Null Values

SELECT * FROM Zepto
WHERE Category IS NULL
OR
  Name IS NULL
OR
 Mrp IS NULL
OR
 Discount_Percent IS NULL
OR
 Available_Quantity IS NULL
OR
 Selling_Price IS NULL
OR
 WeightInGms IS NULL
OR
 Stock IS NULL
OR
 Quantity IS NULL;

-- Data Cleaning -- 

--Products with No or 0 Price

SELECT * FROM Zepto
WHERE Mrp = 0 OR Selling_Price = 0;

DELETE FROM Zepto
WHERE Mrp = 0;

--Converting Paise to Rupees

UPDATE Zepto
SET Mrp = Mrp/100.0, Selling_Price = Selling_Price/100.0;

--Checking Changes

SELECT * FROM Zepto;
SELECT COUNT(*) FROM Zepto;

-- Exploring Data

--Same Product Available Multiple Times

SELECT Name, COUNT(sku_id) AS "Available_Times"
FROM Zepto
GROUP BY Name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

--Checking Amount of Products in Stock
SELECT Stock, COUNT(Stock)
FROM Zepto
GROUP BY Stock;

--Different Categories

SELECT DISTINCT Category
FROM Zepto
GROUP BY Category;

-- DATA ANALYSIS--
SELECT * FROM Zepto;

--What is the Total Inventory Weight Per Category 
	SELECT Category,SUM(WeightInGms*Available_Quantity) AS Total_Weight
	FROM Zepto
	GROUP BY Category
	ORDER BY SUM(WeightInGms*Available_Quantity) DESC;

--Find the price per gram for products above 100g and sort by best value.
	SELECT DISTINCT *,
				ROUND(Selling_Price/WeightInGms,2) AS price_per_gram
	FROM Zepto
	WHERE WeightInGms >= 100
	ORDER BY price_per_gram;

--Group the products into categories like Low, Medium, Bulk.
	SELECT DISTINCT Name, WeightInGms,
	CASE WHEN WeightInGms < 1000 THEN 'Low'
	WHEN WeightInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS Weight_category
	FROM Zepto;

--Find the top 10 best-value products based on the discount percentage.
	SELECT  *
	FROM zepto
	ORDER BY Discount_Percent DESC
	LIMIT 10;

--Calculate Estimated Revenue for each category
	SELECT Category,
	SUM(Selling_Price * Available_Quantity) AS Total_revenue
	FROM zepto
	GROUP BY Category
	ORDER BY Total_revenue;

--Identify the top 5 categories offering the highest average discount percentage.
	SELECT Category, ROUND(AVG(Discount_Percent),2) AS Avg_discount
	FROM Zepto
	GROUP BY Category
	ORDER BY Avg_discount DESC
	LIMIT 5;

--Find all products where MRP is greater than ₹500 and discount is less than 10%.
	SELECT DISTINCT Name, Mrp, Discount_Percent
	FROM Zepto
	WHERE Mrp>500 AND Discount_Percent<10
	ORDER BY Mrp DESC,Discount_Percent DESC ;

--What are the Products with High MRP but Out of Stock
	SELECT DISTINCT Name,Mrp
	FROM Zepto
	WHERE Stock = True and Mrp>300
	ORDER BY Mrp DESC;