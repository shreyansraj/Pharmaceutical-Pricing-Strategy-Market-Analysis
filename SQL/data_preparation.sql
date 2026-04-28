
SELECT 
    brand_name,
    manufacturer,
    price_inr,
    CONCAT(primary_ingredient, ' ', primary_strength) AS composition_key
FROM pharma_data;
