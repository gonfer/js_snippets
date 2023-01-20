-- This script selects all columns from the wp_posts table
-- where the post_content column contains the specific Gutenberg block name

SELECT * FROM wp_posts 
WHERE post_content LIKE '%gutenberg-block-name%';
