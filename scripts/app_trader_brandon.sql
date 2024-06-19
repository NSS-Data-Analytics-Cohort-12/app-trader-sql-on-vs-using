

-- SELECT name, 
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating
-- FROM app_store_apps AS a
-- INNER JOIN play_store_apps AS p
-- USING(name)
-- 	GROUP BY name
-- 	ORDER BY avg_rating DESC

-- select apple.name, 
-- 	google.name,
-- 	max(cast(apple.review_count as integer)) AS apple_max,
-- 	max(cast(google.review_count as integer)) AS google_max
-- from app_store_apps as apple
-- join play_store_apps as google
-- on apple.name = google.name
-- group by apple.name, google.name



-- SELECT name , SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
-- FROM app_store_apps AS a
-- INNER JOIN play_store_apps AS p
-- USING(name)
-- 	GROUP BY name
-- 	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
-- order by total_reviews desc

--This is the total reviews as an integer. We had to change the reviews from text to an integer with the CAST statement

-- Select name,
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
-- 	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
-- from play_store_apps as p
-- inner Join app_store_apps as a
-- USING(name)
-- 	GROUP BY name
-- 	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
-- 	ORDER BY total_reviews DESC

--This is the combined query for average_rating and total_reviews

-- select distinct(primary_genre)
-- from app_store_apps

--Apple genres. We decided that genre wasn't good to narrow down apps with. 

-- select distinct(genres)
-- from play_store_apps

--Google Play apps. We decided that genre wasn't good to narrow down apps with. 




