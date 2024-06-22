

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

-- Select name,
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
-- 	SUM(CAST(a.review_count AS DECIMAL) + p.review_count) AS total_reviews,
-- 	CAST(p.price AS DECIMAL) as google_price
-- from play_store_apps as p
-- inner Join app_store_apps as a
-- USING(name)
-- 	GROUP BY name, google_price
-- 	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
-- 	ORDER BY total_reviews DESC

-- --TO GET THE AVG PRICE FOR BOTH APPS
-- SELECT name, 
-- 	CASE 
-- 	WHEN p.price ::  >= a.price  THEN p.price
-- 	WHEN a.price >= p.price :: NUMERIC THEN a.price
-- 	ELSE 'N/A' END AS app_price
-- 	--AVG((p.price :: INTEGER) + a.price)  AS avg_price
-- FROM app_store_apps AS a
-- INNER JOIN play_store_apps AS p
-- USING(name);
-- --GROUP BY name
-- --ORDER BY avg_price DESC;


-- select name, a.price::money, p.price::money
-- from play_store_apps as p
-- Join app_store_apps as a
-- using (name)

--This gave us the prices for each app converted to the proper data types to compare. 

-- Select name,
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
-- 	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
-- 	p.install_count,
	
-- from play_store_apps as p
-- inner Join app_store_apps as a
-- USING(name)
-- 	GROUP BY name, p.install_count
-- 	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
-- 	ORDER BY total_reviews DESC

-- select name, price
-- from app_store_apps
-- 	where name = 'Doodle Jump'

-- Select name, p.install_count::NUMERIC, a.primary_genre,
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
-- 	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
-- 	a.price::money AS app_store_price, 
-- 	p.price::money AS play_store_price
-- from play_store_apps as p
-- inner Join app_store_apps as a
-- USING(name)
-- 	GROUP BY name, a.price::money, p.price::money,p.install_count, a.primary_genre
-- 	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
-- 	ORDER BY p.install_count::NUMERIC DESC

-- select trim('+' from "install_count")
-- from play_store_apps

-- Select
-- 	name,
-- 	REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC as pi_count,
-- 	p.content_rating,
-- 	a.content_rating,
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
-- 	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
-- 	a.price::money AS app_store_price,
-- 	p.price::money AS play_store_price
-- from play_store_apps as p
-- inner Join app_store_apps as a
-- USING(name)
-- 	GROUP BY name, a.price::money, p.price::money, p.install_count, p.content_rating, a.content_rating
-- 	HAVING SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000
-- 	ORDER BY pi_count DESC;

-- Select
-- 	name,
-- 	CASE 
-- 	WHEN TRIM(REPLACE( p.price ,'$', ''))::NUMERIC >= a.price THEN TRIM(REPLACE( p.price ,'$', ''))::NUMERIC
-- 	WHEN a.price >= TRIM(REPLACE (p.price ,'$', ''))::NUMERIC THEN a.price
-- 	END AS app_price,
-- 	REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC as pi_count,
-- 	p.content_rating,
-- 	a.content_rating,
-- 	ROUND(AVG((p.rating + a.rating)/2),2) AS avg_rating,
-- 	SUM(CAST(a.review_count AS INTEGER) + p.review_count) AS total_reviews,
-- 	((ROUND(AVG((p.rating + a.rating)/2),2) * 2)+1) AS expected_life
-- from play_store_apps as p
-- inner Join app_store_apps as a
-- USING(name)
-- 	GROUP BY name, p.install_count, p.content_rating, a.content_rating, p.price, a.price
-- 	HAVING 
-- 		SUM(CAST(a.review_count AS INTEGER) + p.review_count) >= 1000 AND
-- 		ROUND(AVG((p.rating + a.rating)/2),2) >= 4 AND 
-- 		REPLACE(REPLACE(install_count, '+',''), ',', '') :: NUMERIC >= 500000000
-- 	ORDER BY total_reviews DESC;

--THE REST IS POST WALKTHROUGH--

-- select
-- 	name,
-- 	(10000*12*lifespan) - marketingprice
-- 	-
-- 	(case whencleanedPrice < 1 then 10000
-- 	else10000 * cleanedPrice end) as totalRev
-- from
-- 	(
-- 	select distinct a.name)
-- 	)
	--
-- select
-- 			distinct a.name,
-- 			-- p.name,
-- 			greatest(
-- 				a.price, 
-- 				CAST( TRIM( REPLACE(p.price, '$', '') ) AS numeric )
-- 			) as cleanedPrice
-- --			1 + ( 2 *(round(a.rating + p.rating) / 2 ) ) as lifespan,
-- --			1000 * 12 * ( 1 + ( 2 *( round(a.rating + p.rating) / 2 ) ) ) as marketingPrice
-- 		from app_store_apps a
-- 		inner join play_store_apps p
-- 		on lower(a.name) = lower(p.name)

