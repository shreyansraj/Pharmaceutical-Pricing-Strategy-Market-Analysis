SELECT 
    CONCAT(primary_ingredient, ' ', primary_strength) AS composition_key,
    MIN(price_inr) AS min_price,
    MAX(price_inr) AS max_price,
    MAX(price_inr) * 1.0 / MIN(price_inr) AS price_ratio
FROM pharma_data
GROUP BY composition_key
ORDER BY price_ratio DESC;
