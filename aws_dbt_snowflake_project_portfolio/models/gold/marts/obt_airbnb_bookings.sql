SELECT
    bookings.BOOKING_ID,
    bookings.LISTING_ID,
    listings.HOST_ID,
    hosts.HOST_NAME,
    hosts.HOST_SINCE,
    hosts.IS_SUPERHOST,
    hosts.RESPONSE_RATE,
    hosts.RESPONSE_RATE_QUALITY,
    listings.PROPERTY_TYPE,
    listings.ROOM_TYPE,
    listings.CITY,
    listings.COUNTRY,
    listings.ACCOMMODATES,
    listings.BEDROOMS,
    listings.BATHROOMS,
    listings.PRICE_PER_NIGHT,
    listings.PRICE_PER_NIGHT_TAG,
    bookings.BOOKING_DATE,
    bookings.BOOKING_STATUS,
    bookings.TOTAL_BOOKING_AMOUNT,
    bookings.BOOKING_CREATED_AT,
    listings.LISTING_CREATED_AT,
    hosts.HOST_CREATED_AT
FROM {{ ref('fct_bookings') }} AS bookings
LEFT JOIN {{ ref('dim_listings') }} AS listings
    ON bookings.LISTING_ID = listings.LISTING_ID
LEFT JOIN {{ ref('dim_hosts') }} AS hosts
    ON listings.HOST_ID = hosts.HOST_ID
