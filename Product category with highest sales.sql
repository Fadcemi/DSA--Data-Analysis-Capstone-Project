SELECT 
    k.Region,
    SUM(
        CASE 
            WHEN o.Status = 'returned' THEN 0
            ELSE CAST(k.sales AS FLOAT)
        END
    ) AS Total_net_sales
FROM 
    [KMS Sql Case Study] AS k
LEFT JOIN 
    Order_Status AS o 
    ON k.Order_ID = o.Order_ID
WHERE Region = 'Ontario'
GROUP BY k.Region;
