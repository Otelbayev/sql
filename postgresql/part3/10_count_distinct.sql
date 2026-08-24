SELECT 
    t.name AS tag_name,
    COUNT(DISTINCT(p.id)) as total_posts
FROM tags as t
LEFT JOIN post_tags 
ON t.id = post_tags.tag_id
LEFT JOIN posts as p
ON post_tags.post_id = p.id
GROUP BY t.id, t.name
order by total_posts desc;