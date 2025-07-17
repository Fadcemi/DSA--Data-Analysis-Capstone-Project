-----Most profitable Consumer Customer---

SELECT TOP 1
    k.Customer_Segment,
    k.Customer_Name,
    SUM(
        CASE 
            WHEN o.Status = 'returned' THEN 0
            ELSE CAST(k.Profit AS FLOAT)
        END
    ) AS Most_Profitable
FROM 
    [KMS Sql Case Study] AS k
LEFT JOIN 
    Order_Status AS o 
    ON k.Order_ID = o.Order_ID
WHERE Customer_Segment = 'Consumer'
GROUP BY 
    k.Customer_Segment, k.Customer_Name
ORDER BY 
    Most_Profitable DESC;
