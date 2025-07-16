-- most shipping cost using shipping method--

SELECT TOP 1 
    k.Ship_Mode AS Most_costly_shipping_mode,
    SUM(
      k.Shipping_Cost) AS Total_shipping_cost
FROM 
    [KMS Sql Case Study] AS k
LEFT JOIN 
    Order_Status AS o 
    ON k.Order_ID = o.Order_ID
GROUP BY 
    k.Ship_Mode
ORDER BY 
    Total_shipping_cost DESC;
