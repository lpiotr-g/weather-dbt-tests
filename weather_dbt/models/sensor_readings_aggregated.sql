{{
    config(
        materialized = "table",
        description = "Aggregated daily weather sensor readings."
    )
}}

SELECT
  sensor_id,
  DATE(timestamp) AS reading_date,
  COUNT(event_id) AS event_count,
  AVG(weather.temperature_celsius) AS avg_temperature
FROM
  {{ source('weather_data', 'sensor_readings') }}
GROUP BY
  sensor_id,
  reading_date
