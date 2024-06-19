select *
from app_store_apps
Inner Join play_store_apps
ON app_store_apps.name = play_store_apps.name

	select *
from play_store_apps

select name, rating
from play_store_apps
ORDER BY rating DESC


select name, rating
from app_store_apps
ORDER BY rating DESC



SELECT name, ROUND(AVG((p.rating + a.rating)/2),1) AS avg_rating
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
	GROUP BY name
	ORDER BY avg_rating DESC;





select name, price, content_rating,primary_genre, (cast(review_count as integer)) 
from app_store_apps
order by review_count DESC;


select DISTINCT(genres)
from play_store_apps

select DISTINCT(primary_genre)
from app_store_apps

select DISTINCT(category)
from play_store_apps

	
SELECT name, SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
	GROUP BY name
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY total_reviews DESC;


Select name,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY total_reviews DESC
