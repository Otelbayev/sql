SELECT *
FROM   orders;

SELECT   customer_id,
         COUNT(*) AS total_nr_orders,
         SUM(sales) AS total_sales_orders,
         AVG(sales) AS avg_sales_orders,
         MAX(sales) AS max_sales_orders,
         MIN(sales) AS min_sales_orders
FROM     orders
GROUP BY customer_id;