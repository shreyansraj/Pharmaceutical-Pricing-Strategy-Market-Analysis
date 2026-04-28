SELECT 
    CASE 
        WHEN price_inr < 50 THEN 'Low'
        WHEN price_inr BETWEEN 50 AND 200 THEN 'Mid'
        ELSE 'Premium'
    END AS price_segment,
    COUNT(*) AS num_products
FROM pharma_data
GROUP BY price_segment;
