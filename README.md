
🛒 Zepto Inventory Analysis using SQL

This repository contains the SQL script used for cleaning, exploring, and analyzing inventory data for Zepto (an Indian quick-commerce company) products.

The analysis focuses on understanding product distribution, pricing, inventory weight, discounts, and potential revenue across different product categories.

🗃️ Dataset
The analysis is based on a dataset imported into a PostgreSQL table named Zepto.


🔍 Analysis Highlight

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
