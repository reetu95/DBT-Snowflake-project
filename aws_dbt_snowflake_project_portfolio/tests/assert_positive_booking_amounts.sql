SELECT
    BOOKING_ID
FROM {{ source('staging', 'bookings') }}
WHERE BOOKING_AMOUNT < 0
   OR CLEANING_FEE < 0
   OR SERVICE_FEE < 0
