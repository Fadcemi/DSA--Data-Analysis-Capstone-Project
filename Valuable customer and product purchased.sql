--Most valuable Customers--
SELECT TOP 5
    k.Customer_Name AS Most_valuable_customers,
    SUM(
        CASE 
            WHEN o.Status = 'returned' THEN 0---Sales returned reducing their value 
            ELSE CAST(k.Sales AS FLOAT)
        END
    ) AS Money_spent
FROM 
    [KMS Sql Case Study] AS k
LEFT JOIN 
    Order_Status AS o 
    ON k.Order_ID = o.Order_ID
GROUP BY 
    k.Customer_Name
ORDER BY 
    Money_spent DESC;


--Products or services purchased--

WITH Most_valuable_customers AS (
    SELECT TOP 5
        k.Customer_Name,
        SUM(
            CASE
                WHEN o.Status = 'returned' THEN 0 -- Sales returned reducing their value
                ELSE CAST(k.Sales AS FLOAT)
            END
        ) AS Money_spent
    FROM
        [KMS Sql Case Study] AS k
    LEFT JOIN
        Order_Status AS o
        ON k.Order_ID = o.Order_ID
    GROUP BY
        k.Customer_Name
    ORDER BY
        Money_spent DESC
)
SELECT
    k.Product_Category,
    COUNT(k.Order_ID) AS Number_of_Purchases_by_Valuable_Customers,
    SUM(
        CASE
            WHEN o.Status = 'returned' THEN 0 -- Still account for returns even in category analysis
            ELSE CAST(k.Sales AS FLOAT)
        END
    ) AS Total_Sales_Value_from_Valuable_Customers
FROM
    [KMS Sql Case Study] AS k
LEFT JOIN
    Order_Status AS o
    ON k.Order_ID = o.Order_ID
INNER JOIN -- Use INNER JOIN to filter for only the most valuable customers
    Most_valuable_customers AS m
    ON k.Customer_Name = m.Customer_Name
GROUP BY
    k.Product_Category
ORDER BY
    Total_Sales_Value_from_Valuable_Customers DESC;
