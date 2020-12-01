/* What is an equivalent SQL query? Instead of the sum, find the mean duration by state. */

SELECT state, AVG(duration)
FROM usa_ufo_df
GROUP BY state