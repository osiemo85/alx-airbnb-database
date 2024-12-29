-- 1. INNER JOIN: Retrieve all bookings and their respective users
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
INNER JOIN 
    bookings
ON 
    users.id = bookings.user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews
SELECT 
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM 
    properties
LEFT JOIN 
    reviews
ON 
    properties.id = reviews.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings
SELECT 
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM 
    users
FULL OUTER JOIN 
    bookings
ON 
    users.id = bookings.user_id;
