--- Customer Segment Analysis

WITH Segment_Orders AS (
SELECT 
Customer_Segment,
COUNT(DISTINCT Order_Id) AS Total_Orders,
ROUND(SUM(Order_Profit_Per_Order),2) AS Total_Profit,
ROUND(SUM(Sales)) AS Total_Sales,

 FROM `supplychain-project-28895.Supplychain_project.SupplyChain_data_staging_trimmed_V2`

GROUP BY Customer_Segment
)
SELECT *,
ROW_NUMBER() OVER(ORDER BY Segment_Orders.Total_Orders) As Orders_Rank
FROM Segment_Orders
