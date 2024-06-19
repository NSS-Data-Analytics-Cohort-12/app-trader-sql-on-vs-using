Select name, 
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name
	ORDER BY avg_rating DESC
Limit 20;



select max(cast(review_count as integer)) AS max
from app_store_apps

SELECT name , SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name)
	GROUP BY name
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
Order by total_reviews DESC


Select name, 
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY total_reviews DESC
	Limit 10;

Select price
from app_store_apps

Select price
from play_store_apps

Select name,
	SUM(CAST(p.price AS INTEGER) +(a.price as integer)))AS total_price
from play_store_apps as p
inner Join app_store_apps as a	
	USING(name)
	GROUP BY name
	Having SUM(CAST(p.price AS INTEGER) + a.price) AS total_price
	Order by total_price
