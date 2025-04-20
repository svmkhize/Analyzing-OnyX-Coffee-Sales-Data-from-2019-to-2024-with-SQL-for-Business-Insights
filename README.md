# OnyX Coffee Sales Data from 2019 to 2024 Analysis with SQL for Business Insights
For more of my projects, visit [My Portfolio](https://svmkhize.github.io/Portfolio4SibusisoMkhize.github.io/)

## Table of Contents
---
- [Project Background and Overview](#project-background-and-overview)
- [Data Structure Overview](#data-structure-overview) 
- [Executive Summary](#executive-summary) 
- [Insights Deep-Dive](#insights-deep-dive) 
- [Recommendations](#recommendations)

![OnyX_SQL_Banner](https://github.com/user-attachments/assets/494ad9e1-8f05-457f-b794-6b0bd730c1e5)


## Project Background and Overview
---
OnyX Coffee, established in 2018, is a South Africa-based company that sells coffee in three countries: South Africa, Namibia, and Botswana. 
The company has a significant amount of data on its sales, product offerings, and loyalty program, which has been previously underutilized. I'm partnering with the Head of Operations to thoroughly analyze this data to uncover insights that will enhance OnyX’s profitability and commercial success. 

The goal of this data analysis project is to give the head of operations at OnyX Coffee useful information based on the company's current sales, product, and loyalty program data. The main goal is to provide answers to important strategic questions so that the leadership team can make well-informed decisions that will increase profitability and lead to better commercial success. 
The following primary topics of inquiry will be addressed by the project's thorough investigation of the data that is already available:

**1. Customer Identification and Loyalty:** identifying, characterising, and assessing the top ten consumers based on their purchase value and loyalty program participation. This will assist in identifying the most valued clients and determining how well the loyalty program engages them. 

**2. Loyalty Program Penetration:** Calculating how many clients are presently enrolled in the loyalty program. This will give an indication of the program's total reach and adoption rate. 

**3. Geographic Customer Distribution:** Calculating how many clients come from South Africa, Namibia, and Botswana, the three operating nations. This will provide information on regional client concentration and market penetration.

**4. Product Profitability Analysis:** Examining each OnyX Coffee product's profit margin to determine which are the most and least profitable. Pricing and product strategy decisions will be influenced by this.

**5. High-Performing Products:** Finding goods that generate a sizable amount of income in addition to having high profit margins. This will showcase the main goods that contribute to financial success.

**6. Coffee Bean Type Performance:** Examining the earnings and profits produced by each unique variety of coffee bean that OnyX sells. This will yield useful data for product development and sourcing. 

**7. Roast Preference Analysis:** Identifying the coffee roast type that produces the largest total sales volume, such as light, medium, or dark. This will direct marketing and production activities.

**8. Product Distribution and Country-Specific Sales:** Analysing the volume of orders and sales of coffee bean products in each of the three nations. This will show demand and sales activity particular to the market. 

**9. Country-Specific Financial Performance:** Examining the overall revenue and profit made in each operating nation. The financial contribution of each market will be clearly understood as a result.

**10. Top Products by Country:** Determining which product sells the best in each of the three nations. This will draw attention to product preferences unique to a given market. 

**11. Country-Specific Bean Type Performance:** Analysing the earnings and profits of every variety of coffee bean in every nation. This will give a detailed picture of market-specific bean preferences and profitability.

**12. Top South African Cities for Sales:** Identifying the top 5 South African cities in terms of coffee bean sales volume. This will assist in concentrating distribution and marketing activities in the home market.

**13. Historical Annual Revenue Trends:** Examining OnyX Coffee's total revenue for each of the previous six fiscal years (2019–2024). An outline of the company's revenue growth trend will be provided by this.

**14. Historical Monthly Revenue Trends:** To find seasonal patterns and trends in sales performance, the monthly revenue numbers for the previous six years (2019–2024) are examined.

Through thorough data analysis, this project seeks to answer these questions and provide actionable insights that will enable OnyX Coffee to improve customer engagement, streamline operations, and eventually increase profitability and long-term commercial success in the Southern African market.


## Data Structure Overview
---
OnyX’s database structure as seen below consists of three tables: orders, customers , and products, with a total row of 142 550 records. 

The Dataset was exported from OnyX Coffee MySQL Database as an Excel Sheet which can be found [HERE](https://github.com/svmkhize/OnyX_Coffee_Dataset_Repository/blob/main/OnyX_Coffee_Raw_Dataset.xlsb).

This was inspired by [Kaggle Website Dataset](https://www.kaggle.com/datasets/saadharoon27/coffee-bean-sales-raw-dataset).

![Onyx Coffee ERD](https://github.com/user-attachments/assets/9f5775fb-999f-4bc4-9a12-7410cdebfc4e)


## Executive Summary
---
OnyX Coffee has established a strong market presence in the Southern African region, with South Africa being the leading market, accounting for approximately 70% of total sales (ZAR 2,089,839.73) and total orders (99,927). Botswana is the second-largest market, contributing around 20% to total sales (ZAR 418,953.56) and total orders (28,744). Namibia, while smaller, still makes a notable contribution, representing roughly 9.7% of total sales (ZAR 203,520.08) and total orders (13,879).

**Key Observations:**
- **Market Concentration:** A significant portion of OnyX Coffee's revenue and order volume is concentrated in South Africa.
- **Consistent Performance:** The contribution percentage of each country to total sales closely matches its percentage contribution to total orders, indicating a consistent average order value across the markets.
- **Growth Potential:** While South Africa is currently the stronghold, Botswana and Namibia offer opportunities for further growth and market penetration.

**Considerations:**
1. **Strengthen South African Market Leadership:** Continue investing in and solidifying OnyX Coffee's position in South Africa through targeted marketing campaigns, loyalty programs, and possibly expanding product offerings tailored to local consumer preferences.
2. **Explore Growth Opportunities in Botswana and Namibia:** Conduct market research to better understand consumer preferences and identify growth opportunities in Botswana and Namibia. This may involve targeted marketing initiatives, localised distribution strategies, or partnerships to boost brand awareness and market share.
3. **Maintain Consistent Order Value:** Monitor the average order value in each market to ensure profitability and identify any potential shifts in consumer purchasing behaviour.
4. **Consider Regional Expansion:** Based on initial market success, OnyX Coffee could strategically explore expansion into other neighbouring countries in the Southern African region.

By focusing on strengthening its dominant position in South Africa while strategically pursuing growth opportunities in Botswana and Namibia, OnyX Coffee can further enhance its market presence and drive sustainable growth in the region.

Below is the overview page from the Excel dashboard and more examples are included throughout the report. The entire Excel worksheet containing a dashboard can be downloaded [here](https://github.com/svmkhize/Onyx-Coffee-2019-to-2022-Sales-Analysis/blob/main/OnyX%20Coffee%20Excel%20Workbook.xlsx). Alternatively, an on-demand live demonstration can be seen [here](https://www.loom.com/share/cf6c9fc9cbef4084b240b54cb1bafd85?sid=087cd9cb-fdcb-45a1-9749-66565b2778ce)


![Onyx Executive Summary image](https://github.com/user-attachments/assets/59f013a7-4411-47b7-9d3a-2e552dc72d28)


## Insights Deep-Dive
---
 **1. Customer Identification and Loyalty:** 
 
Who are the 10 best customers? Are they loyalty members?

```sql
SELECT orders.customer_id, customers.customer_name,  customers.loyalty_card, SUM(Quantity) AS quantity_purchased, ROUND(SUM((orders.Quantity * products.unit_price)), 2) AS money_spent
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY orders.customer_id, customers.customer_name, customers.loyalty_card
ORDER BY money_spent DESC
LIMIT 10;
```

![Q1](https://github.com/user-attachments/assets/e5c9daed-ce9f-4ab5-9a73-fa41e7ef5367)

According to customer sales, these are the top ten clients.  According to the table, just 60% of the top ten customers hold loyalty cards.

 **2. Loyalty Program Penetration:** 

How many customers have loyalty cards?

 ```sql
SELECT loyalty_card, COUNT(loyalty_card) AS Count 
FROM customers
GROUP BY loyalty_card;
```
![Q2](https://github.com/user-attachments/assets/4c9c350d-106f-4f8d-b611-9b80db5c5f6c)

Fifty-one percent of consumers possess loyalty cards, while forty-nine percent do not.  It's interesting that, out of the top 10 customers on the list, only 60% had loyalty cards, although 51% of all customers had them.  Customers that purchase more goods from a business are typically more likely to become members.

 **3. Geographic Customer Distribution:** 

  How many customers are from each country?

 ```sql
SELECT customers.country, COUNT(DISTINCT customers.customer_id) AS customer_count
FROM customers
GROUP BY customers.country
ORDER BY customer_count DESC;
```
![Q3](https://github.com/user-attachments/assets/d93ded8f-64f9-4a51-bd72-1901260002d1)

70% of the clients are from South Africa, making them the largest group.

 **4. Product Profitability Analysis:** 

Which product has the largest and the lowest profit margins?

  ```sql
SELECT *
FROM products
WHERE profit = (SELECT Max(profit) FROM products) OR profit = (SELECT Min(profit) FROM products);
```
![Q4](https://github.com/user-attachments/assets/90b0e6e6-f042-4ed4-af32-f36e73bea49f)

Robusta Dark Roast (0.2 kg) has the lowest profit margin of any coffee bean commodity, at ZAR 0.16, while Liberica Light Roast (2.5 kg) has the largest profit margin, at ZAR 4.74.

 **5. High-Performing Products:** 

Products that have the highest profit margins and revenue.

  ```sql
SELECT orders.product_id, products.coffee_type, products.roast_type, products.Size, ROUND(SUM((orders.quantity * products.unit_price)), 2) AS Revenue, ROUND(SUM(orders.quantity * products.profit), 2) AS profit
FROM orders
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY orders.product_id, products.coffee_type, products.roast_type, products.Size
ORDER BY profit DESC
LIMIT 10;
```
![Q5](https://github.com/user-attachments/assets/b14dc6cf-7afe-412f-811f-2d67aedb78b5)

Size 2.5 is the largest size that OnyX Coffee sells, and it makes up the majority of their coffee bean goods.  This suggests that the corporation often makes more money when selling larger quantities of the different kinds of coffee beans.  This makes sense because larger products sell more even though their production costs are probably just somewhat higher.

 **6. Coffee Bean Type Performance:** 

What is the revenue and profit for each coffee bean type?

  ```sql
SELECT products.coffee_type, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue, ROUND(SUM(orders.quantity * products.profit), 2) AS profit
From orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY products.coffee_type
ORDER BY Revenue DESC;
```
![Q6](https://github.com/user-attachments/assets/5ff1448b-5574-487a-8e4f-f24ea54b6d09)

Liberica coffee beans are the most profitable, which suggests that their sales are higher.  Customers place larger orders for Liberica coffee beans as a result, increasing their profit margin.  This indicates that selling Liberica coffee beans is more profitable for the business, therefore they may concentrate their marketing efforts on increasing sales of these beans.

 **7. Roast Preference Analysis:** 

What type of roast generate the most sales?

  ```sql
SELECT products.roast_type, ROUND(SUM(orders.quantity * products.unit_price), 2) AS Revenue
From orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
LEFT JOIN products ON orders.product_id = products.product_id
GROUP BY products.roast_type
ORDER BY Revenue DESC;
```
![Q7](https://github.com/user-attachments/assets/6d2b216f-d65e-4a97-9d01-e3abb3ffba9b)

With ZAR 1,113,800.03 in revenue, light roast is the most popular roast for The Roasters coffee beans.

 **8. Product Distribution and Country-Specific Sales:** 

  ```sql

```

 **9. Country-Specific Financial Performance:** 

  ```sql

```

 **10. Top Products by Country:** 

  ```sql

```

 **11. Country-Specific Bean Type Performance:** 

  ```sql

```

 **12. Top South African Cities for Sales:** 

  ```sql

```

 **13. Historical Annual Revenue Trends:** 

  ```sql

```

 **14. Historical Monthly Revenue Trends:** 

  ```sql

```


## Recommendations
---
**I. Sales Trends and Growth Rates:**

- **Prioritize Order Volume Growth:** While the Average Order Value (AOV) remains stable, future growth should focus on strategies aimed at increasing overall order volume. Consider marketing campaigns that target new customer acquisition and initiatives to encourage repeat purchases from existing customers.

- **Investigate Factors Influencing Fluctuations:** Conduct a thorough analysis of the factors that contributed to negative growth in 2020 and subsequent fluctuations. Understanding these influences, such as economic conditions, competitor activities, and internal operational changes, will enable more informed strategic planning and risk mitigation.

- **Set Ambitious but Realistic Growth Targets:** Based on historical data and market analysis, establish clear and measurable sales growth targets for the coming years. Develop specific strategies and allocate resources to achieve these targets.

- **Explore Potential Seasonality:** Analyse sales data on a more granular level (e.g., monthly) to identify potential seasonal patterns in demand. This information can optimise inventory management, staffing, and marketing efforts throughout the year.

**II. Product Performance Analysis:**

- **Leverage High-Revenue Performers:** Take advantage of the strong performance of Liberica and Excelsa by ensuring consistent sourcing. Explore premium offerings within these categories and highlight their value proposition in marketing materials.

- **Conduct a Strategic Review of Arabica and Robusta:** Analyse the cost structure, pricing strategy, and customer perception of Arabica and Robusta offerings. Consider the following:
  - **Pricing Adjustments:** Evaluate the possibility of modest price increases, if supported by market research.
  - **Value-Added Options:** Introduce blends or speciality preparations featuring Arabica and Robusta at a premium price point.
  - **Targeted Marketing:** Create specific marketing campaigns that emphasise the unique characteristics and appeal of Arabica and Robusta to particular customer segments.

- **Monitor Product Mix:** Continuously track the sales and order volume of each coffee type to identify shifts in customer preferences and adjust product offerings as needed. Consider introducing limited-edition or seasonal coffee types to generate excitement and attract new customers.

**III. Loyalty Program Performance Analysis:**

- **Enhance Member Benefits to Drive Higher AOV:** Implement strategies to encourage loyalty program members to increase their average spending per order. Consider:
  - **Tiered Rewards:** Introduce membership tiers with escalating benefits based on spending or purchase frequency.
  - **Points System with Spending Thresholds:** Award points for every purchase, with bonus points or exclusive rewards available for reaching certain spending milestones.
  - **Member-Exclusive Discounts:** Offer discounts specifically for members who purchase larger quantities or curated product bundles.

- **Personalise Member Experience:** Utilise data on member purchase history and preferences to personalise offers, discounts, and communications. This approach can boost engagement and encourage higher spending.

- **Promote Loyalty Program Benefits Actively:** Clearly communicate the benefits of the loyalty program to both existing and potential members. Highlight the value proposition and incentivise non-members to join.

- **Gather Member Feedback:** Regularly solicit feedback from loyalty program members to understand their needs and preferences. Use this feedback to refine the program and ensure it continues to meet their expectations.

By implementing these recommendations across sales strategies, product offerings, and the loyalty program, OnyX Coffee can build upon its existing strengths, address areas for potential improvement, and drive sustainable and profitable growth in the Southern African market. Continuous monitoring and adaptation based on market trends and customer feedback will be crucial for long-term success.


See the raw data, Excel Dashboard, and pivot tables & charts in the [Excel workbook](https://github.com/svmkhize/Onyx-Coffee-2019-to-2022-Sales-Analysis/blob/main/OnyX%20Coffee%20Excel%20Workbook.xlsx)

See my data cleaning, analysis, Excel Dashboard creation using pivot tables & charts in the [Technical Report](https://github.com/svmkhize/Onyx-Coffee-2019-to-2022-Sales-Analysis/blob/main/OnyX%20Coffee%20Sales%20Analysis%20Technical%20Report.pdf)

For more of my projects, visit [My Portfolio](https://svmkhize.github.io/Portfolio4SibusisoMkhize.github.io/)
