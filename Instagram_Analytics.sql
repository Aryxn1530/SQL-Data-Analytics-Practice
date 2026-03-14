CREATE DATABASE instagram_db ;

USE instagram_db ;

CREATE TABLE instagram_users (
    user_id INT PRIMARY KEY ,
    username VARCHAR(100) NOT NULL ,
    city VARCHAR(50) ,
    signup_date DATE
) ;

CREATE TABLE instagram_posts (
    post_id INT PRIMARY KEY ,
    user_id INT ,
    post_type VARCHAR(20) ,
    caption TEXT ,
    created_at DATETIME ,
    
    CONSTRAINT fk_post_user
    FOREIGN KEY (user_id)
    REFERENCES instagram_users (user_id)
) ;

CREATE TABLE instagram_likes (
    like_id INT PRIMARY KEY ,
    post_id INT ,
    user_id INT ,
    created_at DATETIME ,
    
    CONSTRAINT fk_like_post
    FOREIGN KEY (post_id)
    REFERENCES instagram_posts (post_id),
    
    CONSTRAINT fk_like_user
    FOREIGN KEY (user_id)
    REFERENCES instagram_users (user_id)
) ;

CREATE TABLE instagram_comments (
    comment_id INT PRIMARY KEY ,
    post_id INT ,
    user_id INT ,
    comment_text TEXT ,
    created_at DATETIME ,
    
    CONSTRAINT fk_comment_post
    FOREIGN KEY (post_id)
    REFERENCES instagram_posts (post_id),
    
    CONSTRAINT fk_comment_user
    FOREIGN KEY (user_id)
    REFERENCES instagram_users (user_id)
) ;

CREATE TABLE instagram_followers (
    follow_id INT PRIMARY KEY ,
    follower_id INT ,
    following_id INT ,
    follow_date DATE ,
    
    CONSTRAINT fk_follower_user
    FOREIGN KEY (follower_id)
    REFERENCES instagram_users (user_id) ,
    
    CONSTRAINT fk_following_user
    FOREIGN KEY (following_id)
    REFERENCES instagram_users (user_id)
) ;

SELECT * FROM instagram_users ;
SELECT * FROM instagram_posts ;
SELECT * FROM instagram_likes ;
SELECT * FROM instagram_comments ;
SELECT * FROM instagram_followers ;


SELECT COUNT(*) FROM instagram_users ;
SELECT COUNT(*) FROM instagram_posts ;
SELECT COUNT(*) FROM instagram_likes ;
SELECT COUNT(*) FROM instagram_comments ;
SELECT COUNT(*) FROM instagram_followers ;

-- ============================================================================================================================================================================
--                                                                           BASIC QUERIES 
-- ============================================================================================================================================================================

-- 1 Total users
SELECT COUNT(*) 
FROM instagram_users ;

-- 2 Total posts
SELECT COUNT(*) 
FROM instagram_posts ;

-- 3 Total likes
SELECT COUNT(*) 
FROM instagram_likes ;

-- 4 Total comments
SELECT COUNT(*) 
FROM instagram_comments ;

-- 5 Total follower relationships
SELECT COUNT(*) 
FROM instagram_followers ;

-- 6 Users per city
SELECT city, COUNT(*) AS total_users
FROM instagram_users
GROUP BY city ;

-- 7 Total posts per user
SELECT user_id, COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY user_id ;

-- 8 Total likes per post
SELECT post_id, COUNT(*) AS total_likes
FROM instagram_likes
GROUP BY post_id ;

-- 9 Total comments per post
SELECT post_id, COUNT(*) AS total_comments
FROM instagram_comments
GROUP BY post_id ;

-- 10 Users who posted more than 5 posts
SELECT user_id, COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY user_id
HAVING COUNT(*) > 5 ;

-- 11 Posts created per month
SELECT MONTH(created_at) AS month, COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY MONTH(created_at)
ORDER BY MONTH(created_at) ;

-- 12 Comments created per month
SELECT MONTH(created_at) AS month, COUNT(*) AS total_comments
FROM instagram_comments
GROUP BY MONTH(created_at)
ORDER BY MONTH(created_at) ;

-- 13 Likes created per month
SELECT MONTH(created_at) AS month , 
COUNT(*) AS total_likes
FROM instagram_likes
GROUP BY MONTH(created_at)
ORDER BY MONTH(created_at) ;

-- 14 Top 10 most liked posts
SELECT post_id, COUNT(*) AS likes
FROM instagram_likes
GROUP BY post_id
ORDER BY likes DESC
LIMIT 10 ;

-- 15 Posts with more than 20 likes
SELECT post_id, COUNT(*) AS likes
FROM instagram_likes
GROUP BY post_id
HAVING COUNT(*) > 10 ;

-- 16 Posts with more than 10 comments
SELECT post_id, COUNT(*) AS comments
FROM instagram_comments
GROUP BY post_id
HAVING COUNT(*) > 5 ;

-- 17 Average likes per post
SELECT AVG(like_count) AS avg_likes
FROM
(
SELECT post_id, COUNT(*) AS like_count
FROM instagram_likes
GROUP BY post_id
)t1  ;

-- 18 Average comments per post
SELECT AVG(comment_count) AS avg_count
FROM
(
SELECT post_id, COUNT(*) AS comment_count
FROM instagram_comments
GROUP BY post_id
) t1 ;

-- 19 Most active users by posts
SELECT user_id, COUNT(*) AS posts
FROM instagram_posts
GROUP BY user_id
ORDER BY posts DESC
LIMIT 10 ;

-- 20 Users who never posted
SELECT user_id
FROM instagram_users
WHERE user_id NOT IN
(
SELECT user_id 
FROM instagram_posts
);

-- 21 Posts with no likes
SELECT post_id
FROM instagram_posts
WHERE post_id NOT IN
(
SELECT post_id 
FROM instagram_likes
) ;

-- 22 Posts with no comments
SELECT post_id
FROM instagram_posts
WHERE post_id NOT IN
(
SELECT post_id 
FROM instagram_comments
) ;

-- 23 Followers per user
SELECT following_id, COUNT(*) AS followers
FROM instagram_followers
GROUP BY following_id ;

-- 24 Top influencers
SELECT following_id, COUNT(*) AS followers
FROM instagram_followers
GROUP BY following_id
ORDER BY followers DESC
LIMIT 10 ;

-- 25 Users following more than 50 people
SELECT follower_id, COUNT(*) AS following
FROM instagram_followers
GROUP BY follower_id
HAVING COUNT(*) > 10 ;

-- 26 Posts per type
SELECT post_type, COUNT(*) AS total_posts
FROM instagram_posts
GROUP BY post_type ;

-- 27 Reel posts count
SELECT COUNT(*) AS reels_posts
FROM instagram_posts
WHERE post_type='reel' ;

-- 28 Photo posts count
SELECT COUNT(*) AS post_photo
FROM instagram_posts
WHERE post_type='photo' ;

-- 29 Video posts count
SELECT COUNT(*) AS post_vdo
FROM instagram_posts
WHERE post_type='video' ;

-- 30 Carousel posts count
SELECT COUNT(*) AS post_carousel
FROM instagram_posts
WHERE post_type='carousel' ;

-- 31 Users signed up each month
SELECT MONTH(signup_date), COUNT(*) AS users
FROM instagram_users
GROUP BY MONTH(signup_date)
ORDER BY MONTH(signup_date) ;

-- 32 Most active commenters
SELECT user_id, COUNT(*) AS comments
FROM instagram_comments
GROUP BY user_id
ORDER BY comments DESC
LIMIT 10 ;

-- 33 Most active likers
SELECT user_id, COUNT(*) AS likes
FROM instagram_likes
GROUP BY user_id
ORDER BY likes DESC
LIMIT 10 ;

-- 34 Posts created today
SELECT *
FROM instagram_posts
WHERE DATE(created_at)=CURDATE() ;

-- 35 Posts in last 30 days
SELECT *
FROM instagram_posts
WHERE created_at >= CURDATE() - INTERVAL 30 DAY ;

-- 36 Followers gained this month
SELECT *
FROM instagram_followers
WHERE MONTH(follow_date)=MONTH(CURDATE()) ;

-- 37 Comments today
SELECT *
FROM instagram_comments
WHERE DATE(created_at)=CURDATE() ;

-- 38 Likes today
SELECT *
FROM instagram_likes
WHERE DATE(created_at)=CURDATE() ;

-- 39 Posts containing hashtag travel
SELECT *
FROM instagram_posts
WHERE caption LIKE '%travel%'
ORDER BY post_id ;

-- 40 Posts containing hashtag food
SELECT *
FROM instagram_posts
WHERE caption LIKE '%food%' ;

-- ============================================================================================================================================================================
--                                                                              JOIN QUERIES 
-- ============================================================================================================================================================================

-- 41 Show username and their posts
SELECT u.username, p.post_id
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id ;

-- 42 Show username and post type
SELECT u.username, p.post_type
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id ;

-- 43 Show username and post caption
SELECT u.username, p.caption
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id ;

-- 44 Show username and post creation date
SELECT u.username, p.created_at
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id ;

-- 45 Show posts with number of likes
SELECT p.post_id, COUNT(l.like_id) AS likes
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
GROUP BY p.post_id ;

-- 46 Show posts with number of comments
SELECT p.post_id, COUNT(c.comment_id) AS comments
FROM instagram_posts p
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY p.post_id ;

-- 47 Show username and number of posts
SELECT u.username, COUNT(p.post_id) AS total_posts
FROM instagram_users u
LEFT JOIN instagram_posts p
ON u.user_id = p.user_id
GROUP BY u.username ;

-- 48 Show username and number of likes given
SELECT u.username, COUNT(l.like_id) AS likes_given
FROM instagram_users u
JOIN instagram_likes l
ON u.user_id = l.user_id
GROUP BY u.username ;

-- 49 Show username and number of comments made
SELECT u.username, COUNT(c.comment_id) AS comments
FROM instagram_users u
JOIN instagram_comments c
ON u.user_id = c.user_id
GROUP BY u.username ;

-- 50 Show username and number of followers
SELECT u.username, COUNT(f.follower_id) AS followers
FROM instagram_users u
LEFT JOIN instagram_followers f
ON u.user_id = f.following_id
GROUP BY u.username ;

-- 51 Show username and number of people they follow
SELECT u.username, COUNT(f.following_id) AS following
FROM instagram_users u
LEFT JOIN instagram_followers f
ON u.user_id = f.follower_id
GROUP BY u.username ;

-- 52 Show posts with likes and comments
SELECT p.post_id,
COUNT(DISTINCT l.like_id) AS likes,
COUNT(DISTINCT c.comment_id) AS comments
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY p.post_id ;

-- 53 Show most liked posts
SELECT p.post_id, COUNT(l.like_id) AS likes
FROM instagram_posts p
JOIN instagram_likes l
ON p.post_id = l.post_id
GROUP BY p.post_id
ORDER BY likes DESC
LIMIT 10 ;

-- 54 Show most commented posts
SELECT p.post_id, COUNT(c.comment_id) AS comments
FROM instagram_posts p
JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY comments DESC
LIMIT 10 ;

-- 55 Show username and total likes received
SELECT u.username, COUNT(l.like_id) AS likes_received
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
GROUP BY u.username
ORDER BY likes_received DESC ;

-- 56 Show username and total comments received
SELECT u.username, COUNT(c.comment_id) AS comments_received
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY u.username ;

-- 57 Show most active users by comments
SELECT u.username, COUNT(c.comment_id) AS comments
FROM instagram_users u
JOIN instagram_comments c
ON u.user_id = c.user_id
GROUP BY u.username
ORDER BY comments DESC
LIMIT 10 ;

-- 58 Show most active users by likes
SELECT u.username, COUNT(l.like_id) AS likes
FROM instagram_users u
JOIN instagram_likes l
ON u.user_id = l.user_id
GROUP BY u.username
ORDER BY likes DESC
LIMIT 10 ;

-- 59 Show top influencers by followers
SELECT u.username, COUNT(f.follower_id) AS followers
FROM instagram_users u
JOIN instagram_followers f
ON u.user_id = f.following_id
GROUP BY u.username
ORDER BY followers DESC
LIMIT 10 ;

-- 60 Show posts liked by each user
SELECT u.username, l.post_id
FROM instagram_users u
JOIN instagram_likes l
ON u.user_id = l.user_id ;

-- 61 Show comments with username
SELECT u.username, c.comment_text
FROM instagram_users u
JOIN instagram_comments c
ON u.user_id = c.user_id ;

-- 62 Show posts with username
SELECT u.username, p.post_id
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id ;

-- 63 Show follower relationships with usernames
SELECT u1.username AS follower,
u2.username AS following
FROM instagram_followers f
JOIN instagram_users u1
ON f.follower_id = u1.user_id
JOIN instagram_users u2
ON f.following_id = u2.user_id ;

-- 64 Show users who follow themselves (data check)
SELECT *
FROM instagram_followers
WHERE follower_id = following_id ;

-- 65 Show posts and their creators
SELECT p.post_id, u.username
FROM instagram_posts p
JOIN instagram_users u
ON p.user_id = u.user_id ;

-- 66 Show posts liked by Mumbai users
SELECT l.post_id , u.city
FROM instagram_likes l
JOIN instagram_users u
ON l.user_id = u.user_id
WHERE u.city='Mumbai' ;

-- 67 Show comments by Delhi users
SELECT c.comment_text , u.city
FROM instagram_comments c
JOIN instagram_users u
ON c.user_id = u.user_id
WHERE u.city='Delhi';

-- 68 Show posts by Bangalore users
SELECT p.post_id , u.city
FROM instagram_posts p
JOIN instagram_users u
ON p.user_id = u.user_id
WHERE u.city='Bangalore' ;

-- 69 Show followers of Mumbai users
SELECT COUNT(*) AS mumbai_user 
FROM instagram_followers f
JOIN instagram_users u
ON f.following_id = u.user_id
WHERE u.city='Mumbai' ;

-- 70 Show users with posts but no followers
SELECT u.user_id
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id
LEFT JOIN instagram_followers f
ON u.user_id = f.following_id
WHERE f.following_id IS NULL ;

-- 71 Show posts with zero comments
SELECT p.post_id
FROM instagram_posts p
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
WHERE c.comment_id IS NULL ;

-- 72 Show posts with zero likes
SELECT p.post_id
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
WHERE l.like_id IS NULL ;

-- 73 Show average likes per post
SELECT AVG(likes)
FROM
(
SELECT COUNT(*) AS likes
FROM instagram_likes
GROUP BY post_id
) t ;

-- 74 Show average comments per post
SELECT AVG(comments)
FROM
(
SELECT COUNT(*) AS comments
FROM instagram_comments
GROUP BY post_id
) t ;

-- 75 Show engagement per post
SELECT p.post_id,
COUNT(DISTINCT l.like_id) +
COUNT(DISTINCT c.comment_id) AS engagement
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY p.post_id ;

-- 76 Show top engaged posts
SELECT p.post_id,
COUNT(DISTINCT l.like_id) +
COUNT(DISTINCT c.comment_id) AS engagement
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY p.post_id
ORDER BY engagement DESC
LIMIT 10 ;

-- 77 Show most followed city
SELECT u.city, COUNT(*) AS followers
FROM instagram_followers f
JOIN instagram_users u
ON f.following_id = u.user_id
GROUP BY u.city
ORDER BY followers DESC ;

-- 78 Show users with more followers than following
SELECT following_id
FROM instagram_followers
GROUP BY following_id
HAVING COUNT(*) >
(
SELECT COUNT(*)
FROM instagram_followers
WHERE follower_id = following_id
) ;

-- 79 Show posts created in last 7 days
SELECT *
FROM instagram_posts
WHERE created_at >= CURDATE() - INTERVAL 7 DAY ;

-- 80 Show posts created this month
SELECT *
FROM instagram_posts
WHERE MONTH(created_at) = MONTH(CURDATE()) ;

-- ============================================================================================================================================================================
--                                                                           SUBQUERIES 
-- ============================================================================================================================================================================

-- 81 Users who have posted at least once
SELECT *
FROM instagram_users
WHERE user_id IN
(
SELECT user_id
FROM instagram_posts
) ;

-- 82 Users who never posted
SELECT *
FROM instagram_users
WHERE user_id NOT IN
(
SELECT user_id
FROM instagram_posts
) ;

-- 83 Posts liked by user_id = 10
SELECT *
FROM instagram_posts
WHERE post_id IN
(
SELECT post_id
FROM instagram_likes
WHERE user_id = 10
) ;

-- 84 Posts commented by user_id = 15
SELECT *
FROM instagram_posts
WHERE post_id IN
(
SELECT post_id
FROM instagram_comments
WHERE user_id = 15
) ;

-- 85 Posts with likes greater than average
SELECT post_id
FROM instagram_likes
GROUP BY post_id
HAVING COUNT(*) >
(
SELECT AVG(like_count)
FROM
(
SELECT COUNT(*) AS like_count
FROM instagram_likes
GROUP BY post_id
) t1
) ;

-- 86 Users with followers above average
SELECT following_id
FROM instagram_followers
GROUP BY following_id
HAVING COUNT(*) >
(
SELECT AVG(follower_count)
FROM
(
SELECT COUNT(*) AS follower_count
FROM instagram_followers
GROUP BY following_id
) t1
) ;

-- 87 Posts with comments above average
SELECT post_id 
FROM instagram_comments
GROUP BY post_id
HAVING COUNT(*) >
(
SELECT AVG(comment_count)
FROM
(
SELECT COUNT(*) AS comment_count
FROM instagram_comments
GROUP BY post_id
) t1
) ;

-- 88 Users who liked posts but never commented
SELECT user_id
FROM instagram_likes
WHERE user_id NOT IN
(
SELECT user_id
FROM instagram_comments
) ;

-- 89 Users who commented but never liked
SELECT user_id
FROM instagram_comments
WHERE user_id NOT IN
(
SELECT user_id
FROM instagram_likes
) ;

-- 90 Users who both liked and commented
SELECT DISTINCT user_id
FROM instagram_likes
WHERE user_id IN
(
SELECT user_id
FROM instagram_comments
) ;

-- 91 Posts that received likes
SELECT *
FROM instagram_posts
WHERE post_id IN
(
SELECT post_id
FROM instagram_likes
) ;

-- 92 Posts that received comments
SELECT *
FROM instagram_posts
WHERE post_id IN
(
SELECT post_id
FROM instagram_comments
) ;

-- 93 Posts that received both likes and comments
SELECT *
FROM instagram_posts
WHERE post_id IN
(
SELECT post_id
FROM instagram_likes
)
AND post_id IN
(
SELECT post_id
FROM instagram_comments
) ;

-- 94 Users who follow someone
SELECT *
FROM instagram_users
WHERE user_id IN
(
SELECT follower_id
FROM instagram_followers
) ;

-- 95 Users who are followed by someone
SELECT *
FROM instagram_users
WHERE user_id IN
(
SELECT following_id
FROM instagram_followers
) ;

-- 96 Users who follow more than 10 people
SELECT follower_id
FROM instagram_followers
GROUP BY follower_id
HAVING COUNT(*) > 10; 

-- 97 Users with at least one like
SELECT *
FROM instagram_users
WHERE user_id IN
(
SELECT user_id
FROM instagram_likes
) ;

-- 98 Users with at least one comment
SELECT *
FROM instagram_users
WHERE user_id IN
(
SELECT user_id
FROM instagram_comments
) ;

-- 99 Users who liked more than 20 posts
SELECT user_id
FROM instagram_likes
GROUP BY user_id
HAVING COUNT(*) > 20 ;

-- 100 Users who commented more than 10 times
SELECT user_id
FROM instagram_comments
GROUP BY user_id
HAVING COUNT(*) > 10 ;

-- 101 Posts liked by users from Mumbai
SELECT post_id
FROM instagram_likes
WHERE user_id IN
(
SELECT user_id 
FROM instagram_users
WHERE city='Mumbai'
) ;

-- 102 Posts commented by users from Delhi
SELECT post_id
FROM instagram_comments
WHERE user_id IN
(
SELECT user_id
FROM instagram_users
WHERE city='Delhi'
) ;
 
-- 103 Users who liked posts but have no followers
SELECT user_id
FROM instagram_likes
WHERE user_id NOT IN
(
SELECT following_id
FROM instagram_followers
) ;

-- 104 Users who follow someone but have no posts
SELECT follower_id
FROM instagram_followers
WHERE follower_id NOT IN
(
SELECT user_id
FROM instagram_posts
) ;

-- 105 Posts created by users from Bangalore
SELECT *
FROM instagram_posts
WHERE user_id IN
(
SELECT user_id
FROM instagram_users
WHERE city='Bangalore'
) ;

-- 106 Users with posts but no likes
SELECT user_id
FROM instagram_posts
WHERE post_id NOT IN
(
SELECT post_id
FROM instagram_likes
) ;

-- 107 Users who commented on their own posts
SELECT DISTINCT c.user_id
FROM instagram_comments c
WHERE c.post_id IN
(
SELECT post_id
FROM instagram_posts
WHERE user_id = c.user_id
ORDER BY user_id
) ;

-- 108 Posts liked by followers
SELECT *
FROM instagram_posts
WHERE post_id IN
(
SELECT post_id
FROM instagram_likes
WHERE user_id IN
(
SELECT follower_id
FROM instagram_followers
)
) ;

-- 109 Users who follow influencers (top 10 followers)
SELECT follower_id
FROM instagram_followers
WHERE following_id IN
(
SELECT following_id
FROM instagram_followers
GROUP BY following_id
ORDER BY COUNT(*) DESC
) ;

-- 110 Posts created by influencers
SELECT *
FROM instagram_posts
WHERE user_id IN
(
SELECT following_id
FROM instagram_followers
GROUP BY following_id
HAVING COUNT(*) > 100
) ;

-- =========================================================================================================================================================================================================
--                                                                                     WHEN & CASE QUERIES 
-- =========================================================================================================================================================================================================

-- 111 Classify users by city type
SELECT username, city,
CASE
WHEN city IN ('Mumbai','Delhi','Bangalore') THEN 'Metro'
ELSE 'Non Metro'
END AS city_type
FROM instagram_users ;

-- 112 Classify post types
SELECT post_id, post_type,
CASE
WHEN post_type='reel' THEN 'Short Video'
WHEN post_type='video' THEN 'Long Video'
WHEN post_type='photo' THEN 'Image'
ELSE 'Other'
END AS post_category
FROM instagram_posts ;

-- 113 Classify posts by caption topic
SELECT post_id, caption,
CASE
WHEN caption LIKE '%travel%' THEN 'Travel'
WHEN caption LIKE '%food%' THEN 'Food'
WHEN caption LIKE '%fitness%' THEN 'Fitness'
ELSE 'Other'
END AS topic
FROM instagram_posts ;

-- 114 Classify users by signup year
SELECT username, signup_date,
CASE
WHEN YEAR(signup_date)=2025 THEN 'New User'
ELSE 'Old User'
END AS user_type
FROM instagram_users ;

-- 115 Classify comments sentiment
SELECT comment_id, comment_text,
CASE
WHEN comment_text LIKE '%Nice%' THEN 'Positive'
WHEN comment_text LIKE '%Awesome%' THEN 'Positive'
WHEN comment_text LIKE '%Great%' THEN 'Positive'
ELSE 'Neutral'
END AS sentiment
FROM instagram_comments ;

-- 116 Classify posts by month
SELECT post_id, created_at,
CASE
WHEN MONTH(created_at) <=6 THEN 'First Half'
ELSE 'Second Half'
END AS year_half
FROM instagram_posts ;

-- 117 Label popular posts
SELECT post_id,
CASE
WHEN like_count > 5 THEN 'Popular'
ELSE 'Normal'
END AS popularity
FROM 
(
SELECT post_id, COUNT(*) AS like_count
FROM instagram_likes
GROUP BY post_id
) t1 ;

-- 118 Label active users
SELECT user_id,
CASE
WHEN post_count > 10 THEN 'Highly Active'
WHEN post_count BETWEEN 5 AND 10 THEN 'Moderate'
ELSE 'Low Activity'
END AS activity_level
FROM
(
SELECT user_id, COUNT(*) AS post_count
FROM instagram_posts
GROUP BY user_id
) t1 ;

-- 119 Classify users by follower size
SELECT following_id,
CASE
WHEN COUNT(*) > 10 THEN 'Influencer'
WHEN COUNT(*) BETWEEN 5 AND 10 THEN 'Rising Creator'
ELSE 'Normal User'
END AS user_level
FROM instagram_followers
GROUP BY following_id ;
 
-- 120 Label high engagement posts ----->
SELECT post_id,
CASE
WHEN engagement > 10 THEN 'High Engagement'
WHEN engagement BETWEEN 5 AND 10 THEN 'Medium Engagement'
ELSE 'Low Engagement'
END AS engagement_level
FROM
(
SELECT p.post_id,
COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS engagement
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id=l.post_id
LEFT JOIN instagram_comments c
ON p.post_id=c.post_id
GROUP BY p.post_id
) t1 ;

-- 121 Classify users by comment activity
SELECT user_id,
CASE
WHEN COUNT(*) > 7 THEN 'Heavy Commenter'
ELSE 'Normal Commenter'
END AS comment_type
FROM instagram_comments
GROUP BY user_id ;

-- 122 Classify likes by month
SELECT like_id, created_at,
CASE
WHEN MONTH(created_at)<=6 THEN 'H1'
ELSE 'H2'
END AS half_year
FROM instagram_likes ;

-- 123 Label posts by hashtag type
SELECT post_id, caption,
CASE
WHEN caption LIKE '%travel%' THEN 'Travel Post'
WHEN caption LIKE '%food%' THEN 'Food Post'
ELSE 'General Post'
END AS category
FROM instagram_posts ;

-- 124 Classify followers growth
SELECT following_id,
CASE
WHEN COUNT(*)> 20 THEN 'Fast Growth'
WHEN COUNT(*) BETWEEN 10 AND 20 THEN 'Medium Growth'
ELSE 'Slow Growth'
END AS growth_type
FROM instagram_followers
GROUP BY following_id ;

-- 125 Classify comments length
SELECT comment_id,
CASE
WHEN LENGTH(comment_text)> 7 THEN 'Long Comment'
ELSE 'Short Comment'
END AS comment_type
FROM instagram_comments ;

-- 126 Label active cities
SELECT city,
CASE
WHEN COUNT(*)> 500 THEN 'High User Base'
ELSE 'Low User Base'
END AS city_activity
FROM instagram_users
GROUP BY city ;

-- 127 Classify post engagement by likes
SELECT post_id,
CASE
WHEN COUNT(*)>5 THEN 'Viral'
ELSE 'Normal'
END AS post_status
FROM instagram_likes
GROUP BY post_id ;

-- 128 Classify comment intensity
SELECT post_id,
CASE
WHEN COUNT(*)>10 THEN 'Highly Discussed'
ELSE 'Low Discussion'
END AS discussion_level
FROM instagram_comments
GROUP BY post_id ;

-- 129 Label users by like activity
SELECT user_id,
CASE
WHEN COUNT(*)> 10 THEN 'Highly Active'
ELSE 'Normal'
END AS like_activity
FROM instagram_likes
GROUP BY user_id ;

-- 130 Classify posts by day
SELECT post_id,
CASE
WHEN DAY(created_at)<= 15 THEN 'Early Month'
ELSE 'Late Month'
END AS month_period
FROM instagram_posts ;

-- 131 Label users as influencer or regular
SELECT following_id,
CASE
WHEN COUNT(*)> 10 THEN 'Top Influencer'
ELSE 'Regular'
END AS influencer_type
FROM instagram_followers
GROUP BY following_id ;

-- 132 Classify users by posting frequency
SELECT user_id,
CASE
WHEN COUNT(*)> 5 THEN 'Content Creator'
ELSE 'Casual Poster'
END AS creator_type
FROM instagram_posts
GROUP BY user_id ;

-- 133 Label posts by comment sentiment
SELECT post_id,
CASE
WHEN COUNT(*)> 5 THEN 'Hot Topic'
ELSE 'Normal Post'
END AS comment_status
FROM instagram_comments
GROUP BY post_id ;

-- 134 Classify likes by day of week
SELECT like_id,
CASE
WHEN DAYOFWEEK(created_at) IN (1,7) THEN 'Weekend'
ELSE 'Weekday'
END AS day_type
FROM instagram_likes ;

-- 135 Classify comments by day
SELECT comment_id,
CASE
WHEN DAY(created_at)<=10 THEN 'Early Month'
WHEN DAY(created_at)<=20 THEN 'Mid Month'
ELSE 'Late Month'
END AS period
FROM instagram_comments ;

-- 136 Label users by followers gained
SELECT following_id,
CASE
WHEN COUNT(*)>30 THEN 'Rapid Growth'
ELSE 'Normal Growth'
END AS follower_growth
FROM instagram_followers
GROUP BY following_id ;

-- 137 Classify posts by type popularity
SELECT post_type,
CASE
WHEN COUNT(*)>100 THEN 'Popular Format'
ELSE 'Less Popular'
END AS popularity
FROM instagram_posts
GROUP BY post_type ;

-- 138 Label posts by engagement score
SELECT post_id,
CASE
WHEN engagement >200 THEN 'Highly Viral'
WHEN engagement >100 THEN 'Viral'
ELSE 'Normal'
END AS engagment
FROM
(
SELECT p.post_id,
COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS engagement
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id=l.post_id
LEFT JOIN instagram_comments c
ON p.post_id=c.post_id
GROUP BY p.post_id
) t1 ;

-- 139 Classify users by activity
SELECT user_id,
CASE
WHEN COUNT(*)>30 THEN 'Super Active'
ELSE 'Regular'
END AS activity
FROM instagram_likes
GROUP BY user_id ;

-- 140 Label comments popularity
SELECT comment_id,
CASE
WHEN LENGTH(comment_text)>15 THEN 'Detailed'
ELSE 'Short'
END AS popularityy
FROM instagram_comments ;

-- ============================================================================================================================================================================
--                                                                       WINDOW FUNCTION 
-- =============================================================================================================================================================================

-- 141 Assign row number to users
SELECT user_id, username,
ROW_NUMBER() OVER(ORDER BY user_id) AS row_num
FROM instagram_users ;

-- 142 Assign row numbers to posts
SELECT post_id, user_id,
ROW_NUMBER() OVER(ORDER BY created_at) AS post_rank
FROM instagram_posts ;

-- 143 Rank users by follower count
SELECT following_id,
COUNT(*) AS followers,
RANK() OVER(ORDER BY COUNT(*) DESC) AS follower_rank
FROM instagram_followers
GROUP BY following_id ;

-- 144 Dense rank users by followers
SELECT following_id,
COUNT(*) AS followers,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS densy_ranker 
FROM instagram_followers
GROUP BY following_id ;

-- 145 Rank posts by likes
SELECT post_id,
COUNT(*) AS likes,
RANK() OVER(ORDER BY COUNT(*) DESC) AS like_rank
FROM instagram_likes
GROUP BY post_id ;

-- 146 Dense rank posts by likes
SELECT post_id,
COUNT(*) AS likes,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS like_rank
FROM instagram_likes
GROUP BY post_id ;

-- 147 Assign row numbers to comments
SELECT comment_id, user_id,
ROW_NUMBER() OVER(ORDER BY created_at) AS comment_order
FROM instagram_comments  ;

-- 148 Running total of likes
SELECT post_id,
COUNT(*) AS likes,
SUM(COUNT(*)) OVER(ORDER BY post_id) AS running_likes
FROM instagram_likes
GROUP BY post_id ;

-- 149 Running total of comments
SELECT post_id,
COUNT(*) AS comments,
SUM(COUNT(*)) OVER(ORDER BY post_id) AS running_comments
FROM instagram_comments
GROUP BY post_id ;

-- 150 Average likes using window function
SELECT post_id,
COUNT(*) AS likes,
AVG(COUNT(*)) OVER() AS avg_likes
FROM instagram_likes
GROUP BY post_id ;

-- 151 Average comments using window function
SELECT post_id,
COUNT(*) AS comments,
AVG(COUNT(*)) OVER() AS avg_comments
FROM instagram_comments
GROUP BY post_id ;

-- 152 Rank posts by engagement
SELECT p.post_id,
COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS engagement,
RANK() OVER(ORDER BY COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) DESC) AS engagement_rank
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id=l.post_id
LEFT JOIN instagram_comments c
ON p.post_id=c.post_id
GROUP BY p.post_id ;

-- 153 Rank users by number of posts
SELECT user_id,
COUNT(*) AS posts,
RANK() OVER(ORDER BY COUNT(*) DESC) AS post_rank
FROM instagram_posts
GROUP BY user_id ;

-- 154 Dense rank users by number of posts
SELECT user_id,
COUNT(*) AS posts,
DENSE_RANK() OVER(ORDER BY COUNT(*) DESC) AS post_rank
FROM instagram_posts
GROUP BY user_id ;

-- 155 Rank users by number of comments
SELECT user_id,
COUNT(*) AS comments,
RANK() OVER(ORDER BY COUNT(*) DESC) AS comment_rank
FROM instagram_comments
GROUP BY user_id ;

-- 156 Rank users by number of likes
SELECT user_id,
COUNT(*) AS likes,
RANK() OVER(ORDER BY COUNT(*) DESC) AS like_rank
FROM instagram_likes
GROUP BY user_id ;

-- 157 Partition users by city and rank signup date
SELECT user_id, city, signup_date,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY signup_date) AS city_rank
FROM instagram_users ;

-- 158 Rank posts per user
SELECT post_id, user_id,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) AS post_order
FROM instagram_posts ;

-- 159 Rank comments per user
SELECT comment_id, user_id,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) AS comment_order
FROM instagram_comments ;

-- 160 Rank likes per user
SELECT like_id, user_id,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) AS like_order
FROM instagram_likes ;

-- 161 Top liked posts ranking
SELECT post_id,
COUNT(*) AS likes,
RANK() OVER(ORDER BY COUNT(*) DESC) AS rank_likes
FROM instagram_likes
GROUP BY post_id ;

-- 162 Top commented posts ranking
SELECT post_id,
COUNT(*) AS comments,
RANK() OVER(ORDER BY COUNT(*) DESC) AS rank_comments
FROM instagram_comments
GROUP BY post_id ;

-- 163 Rank users by engagement
SELECT u.user_id,
COUNT(DISTINCT l.like_id) + COUNT(DISTINCT c.comment_id) AS engagement,
RANK() OVER(ORDER BY COUNT(DISTINCT l.like_id)  +  COUNT(DISTINCT c.comment_id) DESC) AS engagement_rank
FROM instagram_users u
LEFT JOIN instagram_posts p
ON u.user_id=p.user_id
LEFT JOIN instagram_likes l
ON p.post_id=l.post_id
LEFT JOIN instagram_comments c
ON p.post_id=c.post_id
GROUP BY u.user_id ;

-- 164 Running followers count
SELECT following_id,
COUNT(*) AS followers,
SUM(COUNT(*)) OVER(ORDER BY following_id) AS running_followers
FROM instagram_followers
GROUP BY following_id ;

-- 165 Average followers per user
SELECT following_id,
COUNT(*) AS followers,
AVG(COUNT(*)) OVER() AS avg_followers
FROM instagram_followers
GROUP BY following_id ;

-- 166 Rank users within city
SELECT user_id, city,
ROW_NUMBER() OVER(PARTITION BY city ORDER BY user_id) AS city_rank
FROM instagram_users;

-- 167 Rank posts within month
SELECT post_id,
MONTH(created_at) AS month,
ROW_NUMBER() OVER(PARTITION BY MONTH(created_at) ORDER BY created_at) AS monthly_rank
FROM instagram_posts ;

-- 168 Rank comments within month
SELECT comment_id,
MONTH(created_at) AS month,
ROW_NUMBER() OVER(PARTITION BY MONTH(created_at) ORDER BY created_at) AS monthly_rank
FROM instagram_comments ; 

-- 169 Rank likes within month
SELECT like_id,
MONTH(created_at) AS month,
ROW_NUMBER() OVER(PARTITION BY MONTH(created_at) ORDER BY created_at) AS monthly_rank
FROM instagram_likes ;

-- 170 Rank influencers by followers
SELECT following_id,
COUNT(*) AS followers,
RANK() OVER(ORDER BY COUNT(*) DESC) AS influencer_rank
FROM instagram_followers
GROUP BY following_id ;

-- ============================================================================================================================================================================
--                                                                     SET OPRATION 
-- ============================================================================================================================================================================

-- 171 Cities from users and post types
SELECT city
FROM instagram_users
UNION
SELECT post_type
FROM instagram_posts ;

-- 172 Cities from users and captions
SELECT city
FROM instagram_users
UNION
SELECT caption
FROM instagram_posts ;

-- 173 User IDs from likes and comments
SELECT user_id
FROM instagram_likes
UNION
SELECT user_id
FROM instagram_comments ;

-- 174 User IDs from posts and likes
SELECT user_id
FROM instagram_posts
UNION
SELECT user_id
FROM instagram_likes ;

-- 175 Post IDs from likes and comments
SELECT post_id
FROM instagram_likes
UNION
SELECT post_id
FROM instagram_comments ;

-- 176 Post IDs from posts and likes
SELECT post_id
FROM instagram_posts
UNION
SELECT post_id
FROM instagram_likes ;

-- 177 User IDs who liked or commented
SELECT user_id
FROM instagram_likes
UNION
SELECT user_id
FROM instagram_comments ;

-- 178 User IDs who posted or commented
SELECT user_id
FROM instagram_posts
UNION
SELECT user_id
FROM instagram_comments ;

-- 179 Post IDs liked or commented
SELECT post_id
FROM instagram_likes
UNION
SELECT post_id
FROM instagram_comments ;

-- 180 Cities and post types with duplicates
SELECT city
FROM instagram_users
UNION ALL
SELECT post_type
FROM instagram_posts ;

-- 181 User IDs from likes and comments including duplicates
SELECT user_id
FROM instagram_likes
UNION ALL
SELECT user_id
FROM instagram_comments ;

-- 182 Post IDs from likes and comments including duplicates
SELECT post_id
FROM instagram_likes
UNION ALL
SELECT post_id
FROM instagram_comments ;

-- 183 User IDs from posts and followers
SELECT user_id
FROM instagram_posts
UNION
SELECT follower_id
FROM instagram_followers ;

-- 184 User IDs from followers and likes
SELECT follower_id
FROM instagram_followers
UNION
SELECT user_id
FROM instagram_likes ;

-- 185 Following users and posting users
SELECT following_id
FROM instagram_followers
UNION
SELECT user_id
FROM instagram_posts ;

-- 186 Cities appearing in users and post captions
SELECT city
FROM instagram_users
INTERSECT
SELECT caption
FROM instagram_posts ;

-- 187 User IDs who liked and commented
SELECT user_id
FROM instagram_likes
INTERSECT
SELECT user_id
FROM instagram_comments ;

-- 188 Post IDs both liked and commented
SELECT post_id
FROM instagram_likes
INTERSECT
SELECT post_id
FROM instagram_comments ;

-- 189 Users who posted and liked
SELECT user_id
FROM instagram_posts
INTERSECT
SELECT user_id
FROM instagram_likes ;

-- 190 Users who posted and commented
SELECT user_id
FROM instagram_posts
INTERSECT
SELECT user_id
FROM instagram_comments ;

-- 191 Users who liked but did not comment
SELECT user_id
FROM instagram_likes
EXCEPT
SELECT user_id
FROM instagram_comments ;

-- 192 Users who commented but did not like
SELECT user_id
FROM instagram_comments
EXCEPT
SELECT user_id
FROM instagram_likes ;

-- 193 Users who posted but did not like
SELECT user_id
FROM instagram_posts
EXCEPT
SELECT user_id
FROM instagram_likes ;

-- 194 Users who posted but did not comment
SELECT user_id
FROM instagram_posts
EXCEPT
SELECT user_id
FROM instagram_comments ;

-- 195 Users who liked but did not post
SELECT user_id
FROM instagram_likes
EXCEPT
SELECT user_id
FROM instagram_posts ;

-- 196 Posts liked but not commented
SELECT post_id
FROM instagram_likes
EXCEPT
SELECT post_id
FROM instagram_comments ;

-- 197 Posts commented but not liked
SELECT post_id
FROM instagram_comments
EXCEPT
SELECT post_id
FROM instagram_likes ;

-- 198 Posts that exist but never liked
SELECT post_id
FROM instagram_posts
EXCEPT
SELECT post_id
FROM instagram_likes ;

-- 199 Posts that exist but never commented
SELECT post_id
FROM instagram_posts
EXCEPT
SELECT post_id
FROM instagram_comments ;

-- 200 Users who follow someone but never posted
SELECT follower_id
FROM instagram_followers
EXCEPT
SELECT user_id
FROM instagram_posts ;

-- 201 Users who posted but follow no one
SELECT user_id
FROM instagram_posts
EXCEPT
SELECT follower_id
FROM instagram_followers ;

-- 202 Users who follow but never liked
SELECT follower_id
FROM instagram_followers
EXCEPT
SELECT user_id
FROM instagram_likes ;

-- 203 Users who liked but follow no one
SELECT user_id
FROM instagram_likes
EXCEPT
SELECT follower_id
FROM instagram_followers ;

-- 204 Users who commented but follow no one
SELECT user_id
FROM instagram_comments
EXCEPT
SELECT follower_id
FROM instagram_followers ;

-- 205 Users who follow and like
SELECT follower_id
FROM instagram_followers
INTERSECT
SELECT user_id
FROM instagram_likes ;

-- 206 Users who follow and comment
SELECT follower_id
FROM instagram_followers
INTERSECT
SELECT user_id
FROM instagram_comments ;

-- 207 Users who follow and post
SELECT follower_id
FROM instagram_followers
INTERSECT
SELECT user_id
FROM instagram_posts ;

-- 208 Users who liked, commented or posted
SELECT user_id FROM instagram_likes
UNION
SELECT user_id FROM instagram_comments
UNION
SELECT user_id FROM instagram_posts ;

-- 209 Posts liked, commented or created
SELECT post_id FROM instagram_posts
UNION
SELECT post_id FROM instagram_likes
UNION
SELECT post_id FROM instagram_comments ;

-- 210 All user activities combined
SELECT user_id FROM instagram_posts
UNION
SELECT user_id FROM instagram_likes
UNION
SELECT user_id FROM instagram_comments ;

-- ============================================================================================================================================================================
--                                                                      REAL-TIME QUERIES 
-- =============================================================================================================================================================================

-- 211 Show username and number of posts
SELECT u.username, COUNT(p.post_id) AS total_posts
FROM instagram_users u
LEFT JOIN instagram_posts p
ON u.user_id = p.user_id
GROUP BY u.username ;

-- 212 Show username and total likes received
SELECT u.username, COUNT(l.like_id) AS likes_received
FROM instagram_users u
JOIN instagram_posts p 
ON u.user_id = p.user_id
LEFT JOIN instagram_likes l 
ON p.post_id = l.post_id
GROUP BY u.username ;

-- 213 Show username and total comments received
SELECT u.username, COUNT(c.comment_id) AS comments_received
FROM instagram_users u
JOIN instagram_posts p 
ON u.user_id = p.user_id
LEFT JOIN instagram_comments c 
ON p.post_id = c.post_id
GROUP BY u.username ;

-- 214 Show top 10 users with most posts
SELECT user_id, COUNT(*) AS posts
FROM instagram_posts
GROUP BY user_id
ORDER BY posts DESC
LIMIT 10 ;

-- 215 Show top 10 posts with most likes
SELECT post_id, COUNT(*) AS likes
FROM instagram_likes
GROUP BY post_id
ORDER BY likes DESC
LIMIT 10 ;

-- 216 Show top 10 posts with most comments
SELECT post_id, COUNT(*) AS comments
FROM instagram_comments
GROUP BY post_id
ORDER BY comments DESC
LIMIT 10 ;

-- 217 Show total engagement per post
SELECT p.post_id,
COUNT(DISTINCT l.like_id) AS likes,
COUNT(DISTINCT c.comment_id) AS comments
FROM instagram_posts p
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
GROUP BY p.post_id ;

-- 218 Show users with more than 100 followers
SELECT following_id, COUNT(*) AS followers
FROM instagram_followers
GROUP BY following_id
HAVING COUNT(*) > 10 ;

-- 219 Show users with more than 10 posts
SELECT user_id, COUNT(*) AS posts
FROM instagram_posts
GROUP BY user_id
HAVING COUNT(*) > 10 ;

-- 220 Show users who liked more than 50 posts
SELECT user_id, COUNT(*) AS likes
FROM instagram_likes
GROUP BY user_id
HAVING COUNT(*) > 20 ;

-- 221 Show users who commented more than 30 times
SELECT user_id, COUNT(*) AS comments
FROM instagram_comments
GROUP BY user_id
HAVING COUNT(*) > 10 ;

-- 222 Show cities with most users
SELECT city, COUNT(*) AS users
FROM instagram_users
GROUP BY city
ORDER BY users DESC ;

-- 223 Show total posts per city
SELECT u.city, COUNT(p.post_id) AS posts
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id
GROUP BY u.city ;

-- 224 Show total likes per city
SELECT u.city, COUNT(l.like_id) AS likes
FROM instagram_users u
JOIN instagram_likes l
ON u.user_id = l.user_id
GROUP BY u.city ;

-- 225 Show total comments per city
SELECT u.city, COUNT(c.comment_id) AS comments
FROM instagram_users u
JOIN instagram_comments c
ON u.user_id = c.user_id
GROUP BY u.city ;

-- 226 Show posts per post type
SELECT post_type, COUNT(*) AS posts
FROM instagram_posts
GROUP BY post_type ;

-- 227 Show most popular post type
SELECT post_type, COUNT(*) AS posts
FROM instagram_posts
GROUP BY post_type
ORDER BY posts DESC
LIMIT 1 ;

-- 228 Show monthly posts count
SELECT MONTH(created_at) AS month, COUNT(*) AS posts
FROM instagram_posts
GROUP BY MONTH(created_at)
ORDER BY MONTH(created_at) ;

-- 229 Show monthly likes count
SELECT MONTH(created_at) AS month, COUNT(*) AS likes
FROM instagram_likes
GROUP BY MONTH(created_at)
ORDER BY MONTH(created_at) ;



-- 230 Show monthly comments count
SELECT MONTH(created_at) AS month, COUNT(*) AS comments
FROM instagram_comments
GROUP BY MONTH(created_at) 
ORDER BY MONTH(created_at) ;

-- 231 Show followers gained per month
SELECT MONTH(follow_date) AS month, COUNT(*) AS followers
FROM instagram_followers
GROUP BY MONTH(follow_date)
ORDER BY MONTH(follow_date) ;

-- 232 Show posts with username
SELECT p.post_id, u.username
FROM instagram_posts p
JOIN instagram_users u
ON p.user_id = u.user_id ;

-- 233 Show comments with username
SELECT u.username, c.comment_text
FROM instagram_comments c
JOIN instagram_users u
ON c.user_id = u.user_id ;

-- 234 Show likes with username
SELECT u.username, l.post_id
FROM instagram_likes l
JOIN instagram_users u
ON l.user_id = u.user_id ;

-- 235 Show follower relationships
SELECT u1.username AS follower,
u2.username AS following
FROM instagram_followers f
JOIN instagram_users u1
ON f.follower_id = u1.user_id
JOIN instagram_users u2
ON f.following_id = u2.user_id ;

-- 236 Show users who have posts and followers
SELECT u.user_id 
FROM instagram_users u
JOIN instagram_posts p
ON u.user_id = p.user_id
JOIN instagram_followers f
ON u.user_id = f.following_id
GROUP BY u.user_id ;

-- 237 Show users with posts but no followers
SELECT p.user_id
FROM instagram_posts p
LEFT JOIN instagram_followers f
ON p.user_id = f.following_id
WHERE f.following_id IS NULL ;

-- 238 Show posts with likes but no comments
SELECT p.post_id
FROM instagram_posts p
JOIN instagram_likes l
ON p.post_id = l.post_id
LEFT JOIN instagram_comments c
ON p.post_id = c.post_id
WHERE c.comment_id IS NULL ;

-- 239 Show posts with comments but no likes
SELECT p.post_id
FROM instagram_posts p
JOIN instagram_comments c
ON p.post_id = c.post_id
LEFT JOIN instagram_likes l
ON p.post_id = l.post_id
WHERE l.like_id IS NULL ;

-- 240 Show users who both liked and commented
SELECT user_id
FROM instagram_likes
INTERSECT
SELECT user_id
FROM instagram_comments ;

-- 241 Show users who liked but did not comment
SELECT user_id
FROM instagram_likes
EXCEPT
SELECT user_id
FROM instagram_comments ;

-- 242 Show users who commented but did not like
SELECT user_id
FROM instagram_comments
EXCEPT
SELECT user_id
FROM instagram_likes ;

-- 243 Show posts liked and commented
SELECT post_id
FROM instagram_likes
INTERSECT
SELECT post_id
FROM instagram_comments ;

-- 244 Show posts liked but not commented
SELECT post_id
FROM instagram_likes
EXCEPT
SELECT post_id
FROM instagram_comments ;

-- 245 Show posts commented but not liked
SELECT post_id
FROM instagram_comments
EXCEPT
SELECT post_id
FROM instagram_likes ;

-- 246 Show users with activity (posts, likes, comments)
SELECT user_id FROM instagram_posts
UNION
SELECT user_id FROM instagram_likes
UNION
SELECT user_id FROM instagram_comments ;

-- 247 Show all active posts
SELECT post_id FROM instagram_posts
UNION
SELECT post_id FROM instagram_likes
UNION
SELECT post_id FROM instagram_comments ;

-- 248 Show users who liked or commented
SELECT user_id FROM instagram_likes
UNION
SELECT user_id FROM instagram_comments ;

-- 249 Show posts with any engagement
SELECT post_id FROM instagram_likes
UNION
SELECT post_id FROM instagram_comments ;

-- 250 Show all user activity records
SELECT user_id FROM instagram_posts
UNION
SELECT user_id FROM instagram_likes
UNION
SELECT user_id FROM instagram_comments ;