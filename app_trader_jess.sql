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


select DISTINCT(category)
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



SELECT name, 
 CASE WHEN 
	
--TO GET THE AVG PRICE FOR BOTH APPS
SELECT name, 
	CASE 
	WHEN CAST(p.price AS NUMERIC) >= a.price THEN p.price
	ELSE a.price
	END AS app_price
FROM app_store_apps AS a
INNER JOIN play_store_apps AS p
USING(name);
--GROUP BY name
--ORDER BY avg_price DESC;

select name, price::text::money
from play_store_apps



select name, a.price::money, p.price::money
from play_store_apps as p
Join app_store_apps as a
using (name)




Select name, p.install_count, a.primary_genre,
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	a.price::money AS app_store_price, 
	p.price::money AS play_store_price
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, a.price::money, p.price::money,p.install_count, a.primary_genre
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY total_reviews DESC




Select name, p.install_count::NUMERIC, 
	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
	a.price::money AS app_store_price, 
	p.price::money AS play_store_price
from play_store_apps as p
inner Join app_store_apps as a
USING(name)
	GROUP BY name, a.price::money, p.price::money, p.install_count
	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
	ORDER BY p.install_count::NUMERIC DESC





select 
name, regexp_replace(p.install_count, '[^0-9]', '','g')::NUMERIC,
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
	ORDER BY install_count DESC;

--use 
Select
	name,
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
	GROUP BY name, a.price::money, p.price::money, p.install_count, p.content_rating, a.content_rating
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
		ROUND(AVG((p.rating + a.rating)/2),2) >= 4.5 AND 
		REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC >= 500000000
	ORDER BY total_reviews DESC;



Select
	name,((ROUND(AVG((p.rating + a.rating)/2),2) * 2)+1) AS expected_life,
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
	((ROUND(AVG((p.rating + a.rating)/2),0) * 2)+1) AS expected_life,
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
		ROUND(AVG((p.rating + a.rating)/2),2) >= 4.0
	 AND 
		REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC >= 500000000
	ORDER BY total_reviews DESC;



