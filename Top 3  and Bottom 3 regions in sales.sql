---TOP 3 REGIONS--
SELECT TOP 3
    Region AS Top_Three_Regions,
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
GROUP BY 
    k.Region
ORDER BY 
    Total_net_sales DESC;





--Bottom 3 regions in sales--
SELECT TOP 3
    Region AS Bottom_Three_Regions,
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
GROUP BY 
    k.Region
ORDER BY 
    Total_net_sales ASC;
