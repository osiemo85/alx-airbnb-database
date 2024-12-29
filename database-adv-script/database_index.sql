-- Create an index for the user_id column in the bookings table to optimize JOIN and WHERE queries
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create an index for the property_id column in the bookings table to optimize JOIN queries
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create an index for the id column in the users table to optimize JOIN and WHERE queries
CREATE INDEX idx_users_id ON users(id);

-- Create an index for the id column in the properties table to optimize JOIN queries
CREATE INDEX idx_properties_id ON properties(id);

-- Create an index for the property_id column in the reviews table to optimize JOIN and WHERE queries
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

