WITH Country_Orders AS (
  SELECT
    Order_Country_Cleaned,
    COUNT(Order_Id) AS Total_Orders,
    SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders
  FROM `supplychain-project-28895.Supplychain_project.SupplyChain_data_staging_trimmed_V2`
  GROUP BY Order_Country_Cleaned
)
SELECT 
  Order_Country_Cleaned,
  Country_Orders.Total_Orders,
  Late_Orders,
  ROUND(Late_Orders / Total_Orders * 100, 2) AS Late_Percentage
FROM Country_Orders
ORDER BY Late_Percentage DESC;





