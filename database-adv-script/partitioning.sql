-- Step 1: Create a partitioned table for bookings
CREATE TABLE bookings_partitioned (
    id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    property_id BIGINT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    PRIMARY KEY (id, start_date)
)
PARTITION BY RANGE (start_date) (
    PARTITION p_2024_q1 VALUES LESS THAN ('2024-04-01'),
    PARTITION p_2024_q2 VALUES LESS THAN ('2024-07-01'),
    PARTITION p_2024_q3 VALUES LESS THAN ('2024-10-01'),
    PARTITION p_2024_q4 VALUES LESS THAN ('2025-01-01')
);

-- Step 2: Insert data into the partitioned table
INSERT INTO bookings_partitioned (id, user_id, property_id, start_date, end_date, status)
SELECT id, user_id, property_id, start_date, end_date, status
FROM bookings;

-- Step 3: Query the partitioned table for a specific date range
EXPLAIN ANALYZE 
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2024-01-01' AND '2024-03-31';

