BEGIN;

UPDATE posts 
SET views = views + 200
WHERE title='Indexes of beginners' AND status = 'draft';

UPDATE posts 
SET status = 'published'
WHERE title='Indexes of beginners' AND status = 'draft';

SELECT title, status, views FROM posts WHERE title='Indexes of beginners' AND status = 'published';

CREATE INDEX IF NOT EXISTS idx_posts_title_status ON posts(title,status);

COMMIT;