SELECT 
    COUNT(*) AS totla_posts,
    COUNT(*) FILTER (WHERE status='published') AS published_posts,
    SUM(views) AS totla_views,
    AVG(views) AS avarage_views,
    MIN(views) AS min_views,
    MAX(views) AS max_views
FROM posts;