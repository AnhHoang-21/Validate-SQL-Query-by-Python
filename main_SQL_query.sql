SELECT SUM(total_sales) AS total_sales_sum
FROM (
    SELECT c.CustomerID, SUM(s.TotalPrice) AS total_sales
    FROM sales s
    JOIN customers c ON s.CustomerID = c.CustomerID
    WHERE c.VIP_customer = 'yes'
    AND s.SaleDate >= '2024-07-01' AND s.SaleDate < '2024-10-01'
    GROUP BY c.CustomerID
) AS vip_sales_summary;