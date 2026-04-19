-- Kontrollu felaket senaryosu:
-- Final analiz tablosunun veri kaybina ugramasi simule edilir.

SELECT COUNT(*) AS before_delete_count
FROM dw.restaurant_ratings;

DELETE FROM dw.restaurant_ratings;

SELECT COUNT(*) AS after_delete_count
FROM dw.restaurant_ratings;
