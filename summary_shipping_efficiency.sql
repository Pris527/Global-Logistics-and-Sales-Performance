--- Shipping Efficiency

SELECT
  Shipping_Mode,
  COUNT(*) AS Total_Orders,
  SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) AS Late_Orders,
  ROUND(SUM(CASE WHEN Delivery_Status = 'Late delivery' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Late_Percentage
FROM `supplychain-project-28895.Supplychain_project.SupplyChain_data_staging_trimmed_V2`
GROUP BY Shipping_Mode
ORDER BY Late_Percentage;

