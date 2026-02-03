SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(oi.sales) AS monthly_revenue,
    SUM(oi.profit) AS monthly_profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

