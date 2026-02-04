SELECT
    o.ship_mode,
    o.region,
    ROUND(AVG(julianday(o.ship_date) - julianday(o.order_date)), 2) AS avg_shipping_days,
    SUM(oi.sales) AS total_sales
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.ship_mode, o.region
ORDER BY avg_shipping_days ASC;
