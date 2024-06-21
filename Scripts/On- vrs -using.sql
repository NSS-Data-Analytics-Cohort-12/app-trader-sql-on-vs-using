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
	Having SUM(CAST(p.price AS INTEGER) + (a.price as integer))) AS total_price
	Order by total_price

SELECT name, 
	CASE 
	WHEN p.price :: Decimal  >= a.price THEN p.price
	WHEN a.price >= p.price :: decimal THEN a.price
	ELSE 'N/A' END AS app_price
	--AVG((p.price :: INTEGER) + a.price)  AS avg_price
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name);
--GROUP BY name
--ORDER BY avg_price DESC

select name, a.price::money, p.price::money
from play_store_apps as p
Join app_store_apps as a
using (name);

Select 
	name,
	Trim('+' from "install_count") as picount,
	p.content_rating,
	a.content_rating,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	a.price::money AS app_store_price, 
	p.price::money AS play_store_price
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, a.price::money, p.price::money, p.install_count, p.content_rating, a.content_rating
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY total_reviews DESC;

Select name, p.install_count::NUMERIC, a.primary_genre,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	a.price::money AS app_store_price, 
	p.price::money AS play_store_price
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, a.price::money, p.price::money,p.install_count, a.primary_genre
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY p.install_count::NUMERIC DESC

Select
	name,
	p.genres, 
	a.primary_genre,
	REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC as pi_count,
	p.content_rating,
	a.content_rating,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	a.price::money AS app_store_price,
	p.price::money AS play_store_price
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, a.price::money, p.price::money, p.install_count, p.content_rating, a.content_rating,p.genres,a.primary_genre,
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY pi_count DESC;

Select  genres, primary_genre
from play_store_apps
Join app_store_apps
using (name)


Select
	name,
	REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC as pi_count,
	p.content_rating,
	a.content_rating,
	a.primary_genre,
	p.genres,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	a.price::money AS app_store_price,
	p.price::money AS play_store_price
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, a.price::money, p.price::money, p.install_count, p.content_rating, a.content_rating,p.genres,a.primary_genre
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY pi_count DESC;

Select
	name,
	CASE 
	WHEN TRIM(REPLACE( p.price ,'$', ''))::NUMERIC >= a.price THEN TRIM(REPLACE( p.price ,'$', ''))::NUMERIC
	WHEN a.price >= TRIM(REPLACE (p.price ,'$', ''))::NUMERIC THEN a.price
	END AS app_price,
	REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC as pi_count,
	p.content_rating,
	a.content_rating,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, p.install_count, p.content_rating, a.content_rating, p.price, a.price
	HAVING 
		SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000 AND
		ROUND(AVG((p.rating + a.rating)/2),2) >= 4.0 AND 
		REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC >= 500000000
	ORDER BY total_reviews DESC;

Select
	name,
	CASE 
	WHEN TRIM(REPLACE( p.price ,'$', ''))::NUMERIC >= a.price THEN TRIM(REPLACE( p.price ,'$', ''))::NUMERIC
	WHEN a.price >= TRIM(REPLACE (p.price ,'$', ''))::NUMERIC THEN a.price
	END AS app_price,
	REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC as pi_count,
	p.content_rating,
	a.content_rating,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	((ROUND(AVG((p.rating + a.rating)/2),2) * 2)+1) AS expected_life
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, p.install_count, p.content_rating, a.content_rating, p.price, a.price
	HAVING 
		SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000 AND
		ROUND(AVG((p.rating + a.rating)/2),2) >= 4 AND 
		REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC >= 500000000
	ORDER BY pi_count DESC;
