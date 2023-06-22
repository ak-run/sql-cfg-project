# sql-cfg-project
This is a SQL final project of SQL Kickstarter with Code First Girls. We had 3 weeks to complete it.

# requirements
1. Create relational DB of your choice with minimum 8 tables
3. Set Primary and Foreign Key constraints to create relations
4. Using any type of the joins create a view that combines multiple tables in a logical way
5. In your database, create a stored function that can be applied to a query in your DB
6. Prepare an example query with a subquery to demonstrate how to extract data from your DB for analysis
7. Create DB diagram where all table relations are shown - first one created

# Extra features which we aim to acheive
1. In your database, create a stored procedure and demonstrate how it runs
2. In your database, create a trigger and demonstrate how it runs
3. In your database, create an event and demonstrate how it runs
4. Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to produce a logically arranged result set for analysis.
5. Prepare an example query with group by and having to demonstrate how to extract data from your DB for analysis

# The database is for an accommodation provider that also sells activities, and it's called SQL Stays
- Our database contains 8 tables, all tables are connected with primary and foreign keys and the database is normalised.
- There is a stored function to show if a customer booked an activity (e.g. helpful to upsell to those customers who didn't).
- Related to that there's a trigger that updates total amount for a booking whenever an activity is booked. If it was a real company, we'd also create similar triggers to update the total when activity is cancelled, room is booked or cancelled.
- A stored procedure allows to delete a booking from bookings, activities_booked, and rooms_booked tables all at once.
- An event shows which rooms are checking-out, that list can be shared with housekeeping team to clean these rooms. 

# We also prepared
- 4 views and their function is explained in the code.
- Query with a subquery displaying customers who spent more than 500.
- Query showing number of bookings each month.

# Future development
- This is not a finished product but a beginning of database, and it gave us opportunity to practise SQL.

