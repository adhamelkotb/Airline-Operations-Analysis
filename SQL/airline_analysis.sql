SELECT
    fc.flight_id,
    ao.airport_name AS "From",
    ao.country AS origin_country,
    ad.airport_name AS "To",
    ac.model AS aircraft_model,
    DATE_PART('month', fc.departure_time) AS departure_month,
    EXTRACT(YEAR FROM CURRENT_DATE) - ac.manufacture_year AS aircraft_age,
    c.crew_id,
    CONCAT(c.first_name, ' ', c.last_name) AS crew_name,
    c.role,
    acr.airport_name AS crew_base,
    EXTRACT(EPOCH FROM (fc.arrival_time - fc.departure_time)) / 60
        AS flight_duration_mins,
    fc.delay_minutes,
    CASE
        WHEN fc.delay_minutes = 0 THEN 'On Time'
        WHEN fc.delay_minutes <= 15 THEN 'Minor Delay'
        WHEN fc.delay_minutes <= 30 THEN 'Moderate Delay'
        WHEN fc.delay_minutes <= 60 THEN 'Major Delay'
        ELSE 'Severe Delay'
    END AS delay_category
FROM project_three.flights_fact fc
LEFT JOIN project_three.aircraft ac
    ON fc.aircraft_id = ac.aircraft_id
LEFT JOIN project_three.airports ao
    ON fc.origin_airport = ao.airport_code
LEFT JOIN project_three.airports ad
    ON fc.destination_airport = ad.airport_code
LEFT JOIN project_three.flight_crew_fact fcf
    ON fc.flight_id = fcf.flight_id
LEFT JOIN project_three.crews c
    ON c.crew_id = fcf.crew_id
LEFT JOIN project_three.airports acr
    ON acr.airport_code = c.home_base
ORDER BY fc.flight_id;
