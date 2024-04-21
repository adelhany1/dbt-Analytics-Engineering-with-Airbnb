

WITH  __dbt__cte__src_listings as (
WITH raw_listings AS (
    SELECT
        *
    FROM
        airbnb.raw.raw_listings
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    price AS price_str,
    created_at,
    updated_at
FROM
    raw_listings
),src_listings AS (
    SELECT * FROM __dbt__cte__src_listings 
)

SELECT 
  listing_id,
  listing_name,
  room_type,
  CASE
    WHEN minimum_nights = 0 THEN 1    -- the Min is 1 : at least 1 night need to be booked to do the reservations
    ELSE minimum_nights
  END AS minimum_nights,
  host_id,
  CAST(REPLACE(price_str, '$', '') AS NUMERIC(10,2)) AS price,  -- delete the $ and convert it to Number up to 2 decimals
  created_at,
  updated_at
FROM
  src_listings