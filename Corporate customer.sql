--Corporate customer with most order placements in 2009-2012--

SELECT TOP 1
    k.Customer_Segment,
	k.Customer_Name,
    SUM(
        CASE 
            WHEN o.Status = 'returned' THEN 0
            ELSE CAST(k.Order_Quantity AS FLOAT)
        END
    ) AS Most_Quantity_order
FROM 
    [KMS Sql Case Study] AS k
LEFT JOIN 
    Order_Status AS o 
    ON k.Order_ID = o.Order_ID
WHERE Customer_Segment = 'Corporate'
GROUP BY 
    k.Customer_Segment, k.Customer_Name
ORDER BY 
    Most_Quantity_order DESC;
