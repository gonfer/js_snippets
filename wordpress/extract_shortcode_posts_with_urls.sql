-- Set the base domain URL for the site
SET @domain = 'https://yoursite.loc';

-- Set the WordPress Admin URL prefix
SET @admin_url_prefix = CONCAT(@domain, '/wp-admin/post.php?post=');

-- Set the dynamic shortcode name without brackets
SET @shortcode_name = 'shortcode-to-search';

-- Dynamically construct the regex pattern to match the shortcode with optional attributes
SET @shortcode_pattern = CONCAT('\\[', @shortcode_name, '([^\\]]*)\\]');

-- Query to retrieve relevant posts containing the shortcode
SELECT
  ID AS post_id,
  post_title,
  CONCAT(@admin_url_prefix, ID, '&action=edit') AS admin_url,
  CONCAT(@domain, '/', post_name) AS post_url,
  REGEXP_SUBSTR(post_content COLLATE utf8mb4_bin, @shortcode_pattern) AS FullShortcode,
  LENGTH(post_content) AS content_length -- Useful for analyzing content size
FROM wp_posts
WHERE post_status = 'publish' -- Filter for published posts only
  AND post_content COLLATE utf8mb4_bin REGEXP @shortcode_pattern
ORDER BY post_date DESC -- Order by most recently published posts
LIMIT 100; -- Limit the number of results for better performance on large datasets
