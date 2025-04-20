# OnyX Coffee Sales Data from 2019 to 2024 Analysis with SQL for Business Insights
For more of my projects, visit [My Portfolio](https://svmkhize.github.io/Portfolio4SibusisoMkhize.github.io/)

## Table of Contents
---
- [Project Background and Overview](#project-background-and-overview)
- [Data Structure Overview](#data-structure-overview) 
- [Executive Summary](#executive-summary) 
- [Insights Deep-Dive](#insights-deep-dive) 
    - [Sales Trends and Growth Rates](#sales-trends-and-growth-rates) 
    - [Product Performance](#product-performance) 
    - [Loyalty Program Performance](#loyalty-program-performance) 
- [Recommendations](#recommendations)

![OnyX_SQL_Banner](https://github.com/user-attachments/assets/494ad9e1-8f05-457f-b794-6b0bd730c1e5)


## Project Background and Overview
---
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
### Sales Trends and Growth Rates

OnyX Coffee's sales data from 2019 to 2024 shows a generally stable performance with a slight upward trend over the six-year period.

### Sales Trends

**Key Observations:**
- **Stable Average Order Value (AOV):** The Average Order Value has consistently remained at ZAR 21 throughout these years, suggesting a stable pricing strategy and consistent purchasing behavior per order.
- **Fluctuating Order Counts:** While the AOV has been steady, the order count has experienced minor fluctuations year-over-year. The highest order count was recorded in 2022 with 24,075 orders, while the lowest was in 2020 with 23,336 orders.
- **Gradual Sales Growth:** Overall, total sales have shown a gradual increase from ZAR 493,447 in 2019 to ZAR 500,853 in 2024.

### Growth Rates

**Growth Observations:**
- The year-over-year growth rate has been relatively modest, ranging from a decrease of 1.76% to an increase of 2.75%.
- The decline in 2020 may be attributed to the initial impacts of the global pandemic on consumer behaviour.
- The strongest growth was observed in 2022.
- A slight dip occurred in 2023, followed by a small recovery in 2024.

**Considerations:**

- **Stability as an Asset:** The consistent AOV indicates a reliable customer base and effective pricing strategy.
- **Opportunities for Increased Order Volume:** Although sales are growing slightly, implementing strategies to boost order volume could result in more significant revenue growth, especially given the stable AOV.
- **External Factors:** Analysing external influences (e.g., economic conditions, competitor activities) may provide insights into the fluctuations in order counts and sales growth.
- **Future Growth Strategies:** Initiatives to attract new customers or encourage more frequent purchases from existing customers could be crucial for accelerating growth.


![Onyx Sales trends and Growth Rates](https://github.com/user-attachments/assets/577e795f-ea0a-440e-a310-142eaf6aa880)


### Product Performance

**Key Observations:**

- **Consistent Order Distribution:** All four coffee types Arabica, Excelsa, Liberica, and Robusta exhibit a remarkably similar order count, with each accounting for approximately 25% of the total orders (ranging from 35,441 to 35,790 orders). This suggests an even demand across the different coffee varieties in terms of transactions.

- **Revenue Disparity:** Despite the evenly distributed order counts, the revenue generated by each coffee type varies significantly.
  - Liberica emerges as the top revenue generator, contributing 29% (ZAR 873,746) to the total revenue.
  - Excelsa follows as the second-highest revenue contributor at 28% (ZAR 821,014).
  - Arabica generates 23% (ZAR 681,946) of the total revenue.
  - Robusta contributes the least, making up 20% (ZAR 607,607) of the revenue.

**Insights:**

- **Higher Value Products:** Liberica and Excelsa, despite having similar order volumes to Arabica and Robusta, generate significantly higher revenue. This indicates that these coffee types likely have a higher average selling price.

- **Potential for Optimization:** The lower revenue contribution from Arabica and Robusta, despite their substantial order volumes, suggests opportunities to explore strategies for increasing their revenue contribution. Potential strategies include:
  - **Price Adjustments:** Carefully evaluate the pricing of Arabica and Robusta relative to their perceived value and market demand.
  - **Value-Added Offerings:** Introduce premium versions or bundles featuring Arabica and Robusta to increase the average transaction value.
  - **Targeted Marketing:** Highlight the unique characteristics and potential benefits of Arabica and Robusta to specific customer segments who might be willing to pay a premium.

**Considerations:**

1. **Focus on High-Performing Products:** Leverage the strong performance of Liberica and Excelsa by ensuring a consistent supply and exploring opportunities to further promote these higher-revenue-generating coffee types.

2. **Analyze Pricing and Value Proposition:** Conduct a detailed analysis of the pricing strategy for each coffee type, considering factors such as the cost of goods sold, competitor pricing, and perceived customer value.

3. **Investigate Strategies for Arabica and Robusta:** Explore opportunities to increase the revenue contribution of Arabica and Robusta through price adjustments, value-added offerings, or targeted marketing campaigns. Understanding the reasons behind their lower average revenue per order is crucial.

4. **Monitor Trends:** Continuously track sales and order trends for each coffee type to identify shifts in customer preferences and adapt strategies accordingly.
  
![OnyX Product Performance](https://github.com/user-attachments/assets/494010f2-7f9e-44c0-9228-80cd6afe78d8)


### Loyalty Program Performance

**Key Observations:**

- **Consistent Order Volumes for Members and Non-Members:** The order counts for both members and non-members have remained relatively stable over the six-year period. Members slightly outnumber non-members in order counts, with a total of 71,967 orders from members compared to 70,583 orders from non-members. This indicates strong engagement from both customer segments.

- **Similar Sales Contributions:** Despite the marginally higher order volume from members, total sales generated by both groups are quite comparable. Members contributed ZAR 1,501,230 in sales, while non-members generated ZAR 1,483,084. This shows that both member and non-member purchases play a significant role in OnyX Coffee's overall revenue.

- **Stable Average Order Value (AOV) Across Segments:** The Average Order Value (AOV) has remained constant at R21 for both members and non-members throughout the years. This suggests that, on average, both groups spend the same amount per order.

**Insights:**

- **Strong Base of Both Members and Non-Members:** OnyX Coffee enjoys a solid customer base among both its loyalty program members and non-members. Both groups consistently place orders and exhibit similar spending habits per order.

- **Loyalty Program Drives Engagement, Not Necessarily Higher Spending:** While the loyalty program encourages repeat business, evidenced by the higher order count from members, it does not appear to have a significant impact on the average amount spent per transaction.

- **Potential for Enhanced Loyalty Benefits:** The consistent AOV between members and non-members indicates an opportunity to improve loyalty program benefits, which could motivate members to increase their spending per order.

**Considerations:**

1. **Focus on Member Retention:** Continue to invest in the loyalty program to retain existing members and encourage repeat purchases. The slightly higher order volume from members highlights the importance of the program in fostering customer loyalty.

2. **Explore Strategies to Increase Member AOV:** Look into various strategies that could promote higher spending among loyalty program members, such as:
   - **Tiered Loyalty Programs:** Introduce different membership tiers with escalating benefits, such as discounts on larger orders or exclusive access to premium products.
   - **Points-Based Systems:** Implement a system where members earn points for each purchase that can be redeemed for discounts or rewards, potentially encouraging larger transactions to accumulate more points.
   - **Member-Exclusive Bundles or Promotions:** Offer special bundles or promotions that are available only to loyalty program members, aiming to boost their average purchase value.

3. **Analyse Member Purchase Behaviour:** Conduct a more in-depth analysis of member purchase patterns to understand their motivations and identify opportunities to tailor offers and benefits that could encourage higher spending.

4. **Evaluate the Cost-Benefit of the Loyalty Program:** Regularly assess the costs associated with the loyalty program versus its benefits, such as member retention and potential increases in spending, to ensure its ongoing effectiveness and profitability.

  
![OnyX Loyalty Program Performance](https://github.com/user-attachments/assets/6c86e51a-6b50-41ba-802e-e713f2b9369e)


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
