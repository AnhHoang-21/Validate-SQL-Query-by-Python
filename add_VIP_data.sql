
ALTER TABLE customers ADD COLUMN VIP_customer VARCHAR(3);

SET SQL_SAFE_UPDATES = 0;

UPDATE customers 
SET VIP_customer = CASE 
                        WHEN EXISTS (SELECT 1 
                                     FROM sales 
                                     WHERE sales.CustomerID = customers.CustomerID 
                                     AND sales.Quantity > 5) 
                        THEN 'yes' 
                        ELSE 'no' 
                   END;
