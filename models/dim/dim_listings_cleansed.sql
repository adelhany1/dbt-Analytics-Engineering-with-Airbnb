{{
  config(
    materialized = 'view'
    )
}}

WITH src_listings AS (
    SELECT * FROM {{ ref('src_listings') }} 
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
