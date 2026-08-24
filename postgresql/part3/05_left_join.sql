SELECT body FROM comments;
SELECT title, status, views FROM posts;

SELECT 
    posts.title AS post_title,
    comments.body AS comment_body
FROM 
    posts
LEFT JOIN  
    comments
ON
    posts.id = comments.post_id
ORDER BY 
    posts.title;


           body           
--------------------------
 Pleasa add more examples
 Very clear explantion

            title            |  status   | views 
-----------------------------+-----------+-------
 Postgresql joins exlplained | published |   100
 Backend apis with psql      | published |   140
 Indexes of beginners        | draft     |   140

         post_title          |       comment_body       
-----------------------------+--------------------------
 Backend apis with psql      | Pleasa add more examples
 Indexes of beginners        | 
 Postgresql joins exlplained | Very clear explantion