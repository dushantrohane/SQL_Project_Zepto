
🛒 Zepto Inventory Analysis using SQL

This repository contains the SQL script used for cleaning, exploring, and analyzing inventory data for Zepto (an Indian quick-commerce company) products.

The analysis focuses on understanding product distribution, pricing, inventory weight, discounts, and potential revenue across different product categories.

🗃️ Dataset
The analysis is based on a dataset imported into a PostgreSQL table named Zepto.


🛒 Zepto Inventory Analysis using SQL
This repository contains the SQL script used for cleaning, exploring, and analyzing inventory data for Zepto (an Indian quick-commerce company) products.

The analysis focuses on understanding product distribution, pricing, inventory weight, discounts, and potential revenue across different product categories.

🗃️ Dataset
The analysis is based on a dataset imported into a PostgreSQL table named Zepto.

Column Name	Data Type	Description
sku_id	SERIAL PRIMARY KEY	Unique product identifier.
Category	VARCHAR(120)	The category of the product (e.g., 'Dairy & Bread').
Name	VARCHAR(150)	The name of the product.
Mrp	NUMERIC(8,2)	Maximum Retail Price (initial price).
Discount_Percent	NUMERIC(5,2)	Discount offered on the product (in percentage).
Available_Quantity	INTEGER	Number of units currently in stock.
Selling_Price	NUMERIC(8,2)	The discounted price.
WeightInGms	INTEGER	Weight of a single unit in grams.
Stock	BOOLEAN	Indicates if the product is currently in stock (True/False).
Quantity	INTEGER	A general quantity field (its meaning is unclear without metadata, but it's present).
🔍 Analysis Highlights
The Zepto_SQL_Project.sql file contains queries covering the following areas:

🧹 Data Cleaning
Handling Missing/Zero Prices: Products with an MRP of 0 were deleted.

Unit Conversion: Mrp and Selling_Price were updated by dividing by 100, assuming an initial unit was in paise and needed conversion to rupees.

💡 Data Exploration
Checking for duplicate product names.

Counting the total number of products currently in stock versus out of stock.

Identifying the unique product categories.

📊 Data Analysis

Inventory Weight: Calculated the total inventory weight per category (WeightInGms * Available_Quantity).

Value Calculation: Found the price per gram for products ≥100g to identify the best value.

Weight Categorization: Grouped products into weight categories: 'Low' (<1000g), 'Medium' (<5000g), and 'Bulk' (≥5000g).

Top Discounts: Identified the top 10 best-value products based on Discount_Percent.

Estimated Revenue: Calculated the total estimated revenue per category (∑Selling_Price×Available_Quantity).

Average Discount: Identified the top 5 categories with the highest average discount percentage.

Premium/Low Discount: Found products with a high MRP (>₹500) but a low discount (≤10%).

High-Value Stock: Found products with high MRP (>₹300) that are currently in stock.

🛠️ Technology Used
SQL (PostgreSQL): Used for database creation, data manipulation, and analysis.

pgAdmin4: Used as the GUI to manage the database and import the CSV file.
