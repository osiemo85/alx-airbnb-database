-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT 
    bookings.id AS booking_id,
    users.name AS user_name,
    properties.name AS property_name,
    payments.amount AS payment_amount,
    payments.payment_date
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id
INNER JOIN 
    properties ON bookings.property_id = properties.id
INNER JOIN 
    payments ON bookings.id = payments.booking_id;

