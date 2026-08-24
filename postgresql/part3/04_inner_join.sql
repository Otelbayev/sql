
SELECT id, name FROM users;
SELECT user_id, title, status, views FROM posts;


SELECT 
    users.name AS author_name,
    posts.title AS post_title,
    posts.status, 
    posts.views
FROM
    posts
INNER JOIN 
    users
ON
    posts.user_id = users.id
WHERE
    posts.status = 'published'
ORDER BY 
    posts.views 
ASC;

   name   
----------
 Jasurbek
 None

            title            |  status   | views 
-----------------------------+-----------+-------
 Postgresql joins exlplained | published |   100
 Backend apis with psql      | published |   140
 Indexes of beginners        | draft     |   140

 author_name |         post_title          |  status   | views 
-------------+-----------------------------+-----------+-------
 None        | Postgresql joins exlplained | published |   100
 Jasurbek    | Backend apis with psql      | published |   140