SELECT current_database() AS restored_database_name;

SELECT 'raw_geoplaces_row_count' AS metric, COUNT(*)::text AS value
FROM raw.geoplaces2
UNION ALL
SELECT 'raw_userprofile_row_count', COUNT(*)::text
FROM raw.userprofile
UNION ALL
SELECT 'raw_rating_final_row_count', COUNT(*)::text
FROM raw.rating_final
UNION ALL
SELECT 'stg_restaurants_row_count', COUNT(*)::text
FROM stg.restaurants
UNION ALL
SELECT 'stg_users_row_count', COUNT(*)::text
FROM stg.users
UNION ALL
SELECT 'stg_ratings_row_count', COUNT(*)::text
FROM stg.ratings
UNION ALL
SELECT 'dw_restaurant_ratings_row_count', COUNT(*)::text
FROM dw.restaurant_ratings;

SELECT
    restaurant_name,
    city,
    COUNT(*) AS vote_count,
    ROUND(AVG(overall_rating::numeric), 2) AS avg_rating
FROM dw.restaurant_ratings
GROUP BY restaurant_name, city
HAVING COUNT(*) >= 3
ORDER BY avg_rating DESC, vote_count DESC
LIMIT 10;
