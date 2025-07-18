--Customer that returned items and segment they belong to--

SELECT 
    k.Customer_Segment,
	k.Customer_Name,
	SUM(
		CASE
			WHEN o.Status = 'returned' THEN CAST(k.Sales AS FLOAT)
		END
	) AS Total_sales_returned
FROM 
    [KMS Sql Case Study] AS k
RIGHT JOIN 
    Order_Status AS o ON
    k.Order_ID = o.Order_ID
GROUP BY 
	k.Customer_Segment, k.Customer_Name  	
ORDER BY 
    k.Customer_Segment DESC;


-----Segment they belong to--------

WITH Segment_mostly_returned AS (
	SELECT 
    k.Customer_Segment,
	SUM(
		CASE
			WHEN o.Status = 'returned' THEN CAST(k.Sales AS FLOAT)
		END
	) AS Total_sales_returned
FROM 
    [KMS Sql Case Study] AS k
RIGHT JOIN 
    Order_Status AS o ON
    k.Order_ID = o.Order_ID
GROUP BY 
	k.Customer_Segment
)
SELECT 
	Customer_Segment,
	Total_sales_returned
FROM
	Segment_mostly_returned
ORDER BY
	Customer_Segment DESC, Total_sales_returned DESC;
