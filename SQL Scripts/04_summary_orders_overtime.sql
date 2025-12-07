--- Orders Trend Overtime

SELECT
COUNT(Order_Id) AS Total_Orders,
Order_Year,
Order_Month,
FROM `supplychain-project-28895.Supplychain_project.SupplyChain_data_staging_trimmed_V2`
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year,Order_Month;



