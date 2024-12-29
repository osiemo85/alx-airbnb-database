# Index Performance Optimization

## Objective
Optimize query performance by identifying high-usage columns and creating indexes.

## Identified High-Usage Columns
Based on query analysis, the following columns were identified as high-usage:
- `bookings.user_id`: Frequently used in `JOIN` and `WHERE` clauses.
- `bookings.property_id`: Used in `JOIN` clauses with `properties`.
- `users.id`: Used in `JOIN` and `WHERE` clauses with `bookings`.
- `properties.id`: Used in `JOIN` clauses with `bookings` and `reviews`.
- `reviews.property_id`: Used in `JOIN` and `WHERE` clauses.

## Indexes Created
1. **Bookings Table**:
   - Index: `idx_bookings_user_id` on `user_id`.
   - Index: `idx_bookings_property_id` on `property_id`.

2. **Users Table**:
   - Index: `idx_users_id` on `id`.

3. **Properties Table**:
   - Index: `idx_properties_id` on `id`.

4. **Reviews Table**:
   - Index: `idx_reviews_property_id` on `property_id`.

## Query Performance Analysis
### Methodology
- **Before Indexing**: Query execution plans were analyzed using `EXPLAIN`.
- **After Indexing**: Query execution plans were re-analyzed using `EXPLAIN` to measure improvements.

### Results

#### Query 1: Retrieve all bookings and their respective users
**SQL Query**:
```sql
SELECT 
    users.id, users.name, bookings.id, bookings.property_id
FROM 
    users
INNER JOIN 
    bookings
ON 
    users.id = bookings.user_id;

