--Small business customer with highest sales--

SELECT TOP 1
    k.Customer_Segment,
	k.Customer_Name,
    SUM(
        CASE 
            WHEN o.Status = 'returned' THEN 0
            ELSE CAST(k.sales AS FLOAT)
        END
    ) AS Highest_net_sales
FROM 
    [KMS Sql Case Study] AS k
LEFT JOIN 
    Order_Status AS o 
    ON k.Order_ID = o.Order_ID
WHERE Customer_Segment = 'Small Business'
GROUP BY 
    k.Customer_Segment, k.Customer_Name
ORDER BY 
    Highest_net_sales DESC;
