
SELECT id, title, views, status FROM posts WHERE status = 'published';

CREATE INDEX IF NOT EXISTS idx_posts_status ON posts(status);

SELECT title, views status FROM posts WHERE status = 'published';

CREATE INDEX IF NOT EXISTS idx_posts_status_views ON posts(status, views desc);