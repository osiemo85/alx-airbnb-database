-- 1. Non-Correlated Subquery: Find all properties where the average rating is greater than 4.0
SELECT 
    properties.id AS property_id,
    properties.name AS property_name
FROM 
    properties
WHERE 
    properties.id IN (
        SELECT 
            reviews.property_id
        FROM 
            reviews
        GROUP BY 
            reviews.property_id
        HAVING 
            AVG(reviews.rating) > 4.0
    );

-- 2. Correlated Subquery: Find users who have made more than 3 bookings
SELECT 
    users.id AS user_id,
    users.name AS user_name
FROM 
    users
WHERE 
    (
        SELECT 
            COUNT(bookings.id)
        FROM 
            bookings
        WHERE 
            bookings.user_id = users.id
    ) > 3;

