-- Top customers by lifetime value
SELECT 
    c.customer_id,
    c.name,
    SUM(oi.sales) AS lifetime_value,
    RANK() OVER (ORDER BY SUM(oi.sales) DESC) AS customer_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.name;

-- Low margin products
SELECT 
    p.product_name,
    p.category,
    SUM(oi.sales) AS revenue,
    SUM(oi.profit) AS profit,
    ROUND(SUM(oi.profit)/SUM(oi.sales)*100, 2) AS profit_margin_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name, p.category
HAVING profit_margin_pct < 20
ORDER BY profit_margin_pct ASC;

