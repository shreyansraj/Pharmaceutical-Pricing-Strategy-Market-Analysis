SELECT *
FROM (
    SELECT 
        manufacturer,
        price_segment,
        COUNT(*) AS num_products,
        ROW_NUMBER() OVER (
            PARTITION BY price_segment 
            ORDER BY COUNT(*) DESC
        ) AS rank_in_segment
    FROM (
        SELECT 
            manufacturer,
            CASE 
                WHEN price_inr < 50 THEN 'Low'
                WHEN price_inr BETWEEN 50 AND 200 THEN 'Mid'
                ELSE 'Premium'
            END AS price_segment
        FROM pharma_data
    )
    GROUP BY manufacturer, price_segment
)
WHERE rank_in_segment <= 10;
