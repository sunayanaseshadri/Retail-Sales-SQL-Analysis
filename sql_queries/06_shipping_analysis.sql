SELECT 
    p.category,
    SUM(oi.sales) AS revenue,
    SUM(oi.profit) AS profit,
    ROUND(SUM(oi.profit)/SUM(oi.sales)*100, 2) AS profit_margin_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY profit DESC;

