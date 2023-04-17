-- Part 1 Creating Table 
-- Drop table if exists
DROP TABLE IF EXISTS time_dimension;
-- Create table with required parameters
CREATE TABLE time_dimension (
    date DATE PRIMARY KEY,
    day INTEGER,
    month INTEGER,
    year INTEGER,
    quarter INTEGER,
    day_of_week VARCHAR,
    month_of_year VARCHAR,
    is_weekend BOOLEAN
);

-- Part 2 Inserting Sample Data
INSERT INTO time_dimension (date, day, month, year, quarter, day_of_week, month_of_year, is_weekend)
VALUES 
('2023-01-01', 1, 1, 2023, 1, 'Sunday', 'January', TRUE),
('2023-01-02', 2, 1, 2023, 1, 'Monday', 'January', FALSE),
('2023-01-03', 3, 1, 2023, 1, 'Tuesday', 'January', FALSE),
('2023-01-04', 4, 1, 2023, 1, 'Wednesday', 'January', FALSE),
('2023-01-05', 5, 1, 2023, 1, 'Thursday', 'January', FALSE),
('2023-01-06', 6, 1, 2023, 1, 'Friday', 'January', FALSE),
('2023-01-07', 7, 1, 2023, 1, 'Saturday', 'January', TRUE),
('2023-01-08', 8, 1, 2023, 1, 'Sunday', 'January', TRUE),
('2023-01-09', 9, 1, 2023, 1, 'Monday', 'January', FALSE),
('2023-01-10', 10, 1, 2023, 1, 'Tuesday', 'January', FALSE);

-- Part 3 Answering Basic Questions with Sample Data
-- How many weekdays are there in the first 10 days of 2023?
SELECT COUNT(*) 
FROM time_dimension 
WHERE is_weekend = FALSE;

-- How many weekends are there in the first 10 days of 2023?
SELECT COUNT(*) 
FROM time_dimension 
WHERE is_weekend = TRUE;

-- Part 4 Populating Table
-- Truncate table to clear data from above first
TRUNCATE TABLE time_dimension;
-- Use extract and generate series to generate dates
WITH six_year_date_values AS (
    SELECT
        date,
        EXTRACT(DAY FROM date)::INT AS day,
        EXTRACT(MONTH FROM date)::INT AS month,
        EXTRACT(YEAR FROM date)::INT AS year,
        EXTRACT(QUARTER FROM date)::INT AS quarter,
        TO_CHAR(date, 'Day') AS day_of_week,
        TO_CHAR(date, 'Month') AS month_of_year,
        CASE WHEN EXTRACT(DOW FROM date) IN (0, 6) THEN TRUE ELSE FALSE END AS is_weekend
    FROM generate_series(
        DATE '2020-01-01',
        DATE '2025-12-31',
        INTERVAL '1 day'
    ) AS date
)
INSERT INTO time_dimension (date, day, month, year, quarter, day_of_week, month_of_year, is_weekend)
SELECT * FROM six_year_date_values;

-- How many days in total from the years 2020 to 2025?
SELECT COUNT(*) FROM time_dimension WHERE year BETWEEN 2020 AND 2025;

-- How many weekends are in the year 2024?
SELECT COUNT(*) FROM time_dimension WHERE year = 2024 AND is_weekend = TRUE;

-- How many weekdays are there in the third quarter of 2023?
SELECT COUNT(*) 
FROM time_dimension 
WHERE year = 2023 
AND quarter = 3 
AND is_weekend = FALSE;
