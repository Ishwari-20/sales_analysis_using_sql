sales_analysis_using_sql
# Problem Statement:
Analyzing sales from dataset of E-commerce website- zepto.

# Dataset
The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.
Each row represents a unique SKU (Stock Keeping Unit) for a product. 
Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility.

# Columns:
- sku_id: Unique identifier for each product entry (Synthetic Primary Key)
- name: Product name as it appears on the app
- category: Product category like Fruits, Snacks, Beverages, etc.
- mrp: Maximum Retail Price (originally in paise, converted to ₹)
- discountPercent: Discount applied on MRP
- discountedSellingPrice: Final price after discount (also converted to ₹)
- availableQuantity: Units available in inventory
- weightInGms: Product weight in grams
- outOfStock: Boolean flag indicating stock availability
- quantity: Number of units per package (mixed with grams for loose produce)

# Project Workflow
1. Database & Table Creation
2. Data Import : Loading .csv files into mysql.
<img width="936" height="683" alt="Screenshot 2025-12-24 132018" src="https://github.com/user-attachments/assets/e8597636-386b-4ede-afe3-033fa6e0c61a" />

3. Data Exploration
- Counted the total number of records in the dataset
<img width="945" height="364" alt="Screenshot 2025-12-24 132223" src="https://github.com/user-attachments/assets/db2acd24-35ff-4343-8923-d77c9d11f9ca" />

- Checked for null values across all columns
<img width="942" height="710" alt="Screenshot 2025-12-24 132355" src="https://github.com/user-attachments/assets/d305fcbe-d66e-469c-9d18-f781d5109bc6" />

- Identified distinct product categories available in the dataset
<img width="939" height="684" alt="Screenshot 2025-12-24 132629" src="https://github.com/user-attachments/assets/103d6cc8-9ffd-4c78-8efe-cdc9ed5eebf0" />

- Compared in-stock vs out-of-stock product counts
<img width="933" height="663" alt="Screenshot 2025-12-24 132703" src="https://github.com/user-attachments/assets/51d915d7-a722-42a6-9a1c-38b780dea2ad" />

- Detected products present multiple times, representing different SKUs
<img width="940" height="702" alt="Screenshot 2025-12-24 132819" src="https://github.com/user-attachments/assets/6dd0b5b3-4486-4dcb-940b-420f4b085ebd" />

4. Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero
<img width="940" height="449" alt="Screenshot 2025-12-24 133009" src="https://github.com/user-attachments/assets/c17aea6a-63ca-4078-a642-cf6e8ac5f389" />
<img width="928" height="460" alt="Screenshot 2025-12-24 133449" src="https://github.com/user-attachments/assets/af57371e-06f0-4d5d-81fb-f3c9a16a0de3" />

- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
<img width="923" height="619" alt="Screenshot 2025-12-24 133608" src="https://github.com/user-attachments/assets/548ae444-708e-4a1a-983f-49bc865f2a3b" />

5. Business Insights- Queries
- Find top 10 best-value products based on discount percentage
<img width="941" height="681" alt="Screenshot 2025-12-24 134011" src="https://github.com/user-attachments/assets/03c4ddab-9789-4db6-9648-1559685faecc" />

- Identified high-MRP products that are currently out of stock
<img width="936" height="689" alt="Screenshot 2025-12-24 134313" src="https://github.com/user-attachments/assets/a2b9f2da-559c-4ddb-80d9-aafd45ec7880" />

- Estimated potential revenue for each product category
<img width="935" height="718" alt="Screenshot 2025-12-24 135052" src="https://github.com/user-attachments/assets/d2faa394-c5d2-47ed-8416-60ec5ecc8a07" />

- Filtered expensive products (MRP > ₹500) with minimal discount
<img width="939" height="699" alt="Screenshot 2025-12-24 135318" src="https://github.com/user-attachments/assets/a490bb8c-323b-4d2b-b64d-972137096504" />

- Ranked top 5 categories offering highest average discounts
<img width="940" height="479" alt="Screenshot 2025-12-24 135600" src="https://github.com/user-attachments/assets/42a1e190-6256-4613-988c-279560aaf8a6" />

- Calculated price per gram to identify value-for-money products
<img width="941" height="715" alt="Screenshot 2025-12-24 135839" src="https://github.com/user-attachments/assets/b3088b71-6428-4f67-933c-fd503f3ded0a" />

- Grouped products based on weight into Low, Medium, and Bulk categories
<img width="930" height="712" alt="Screenshot 2025-12-24 140439" src="https://github.com/user-attachments/assets/aee58e37-447c-463d-a841-003df2c04469" />

- Measured total inventory weight per product category
<img width="920" height="605" alt="Screenshot 2025-12-24 140059" src="https://github.com/user-attachments/assets/8e3489bc-a4f2-4c47-862c-50415389dd3d" />
