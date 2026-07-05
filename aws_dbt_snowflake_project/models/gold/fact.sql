{% set configs = [
    {
        "table" : "AIRBNB.GOLD.OBT",
        "columns": "GOLD_obt.BOOKING_ID, GOLD_obt.LISTING_ID, GOLD_obt.HOST_ID, GOLD_obt.TOTAL_BOOKING_AMOUNT, GOLD_obt.ACCOMMODATES, GOLD_obt.BEDROOMS, GOLD_obt.BATHROOMS, GOLD_obt.PRICE_PER_NIGHT, GOLD_obt.RESPONSE_RATE",
        "alias": "GOLD_obt"
    },
    {
        "table" : "AIRBNB.GOLD.DIM_LISTINGS",
        "columns": "",
        "alias": "GOLD_listings",
        "join_condition" : "GOLD_obt.LISTING_ID = GOLD_listings.LISTING_ID AND GOLD_listings.DBT_VALID_TO = TO_DATE('9999-12-31')"
    },
    {
        "table": "AIRBNB.GOLD.DIM_HOSTS",
        "columns": "",
        "alias": "GOLD_hosts",
        "join_condition" : "GOLD_obt.HOST_ID = GOLD_hosts.HOST_ID AND GOLD_hosts.DBT_VALID_TO = TO_DATE('9999-12-31')"
    }
] %}


SELECT 
        {{ configs[0]['columns'] }}
FROM 
    {% for config in configs%}
    {% if loop.first %}
        {{ config['table']}} AS {{ config['alias']}}
    {% else %}
        LEFT JOIN {{ config['table']}} AS {{config['alias']}}
        ON {{ config['join_condition']}}
        {% endif %}
        {% endfor %}
