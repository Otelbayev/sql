-- SELECT *
-- FROM   customers;
-- SELECT country,
--        score
-- FROM   customers;
-- SELECT *
-- FROM   customers
-- WHERE  score > 500;
-- SELECT *
-- FROM   customers
-- WHERE  country = 'Germany';
-- SELECT   *
-- FROM     customers
-- WHERE    score != 0
-- ORDER BY score DESC;
-- SELECT   *
-- FROM     customers
-- WHERE    score != 0
-- ORDER BY score ASC, country DESC;
-- SELECT   *
-- FROM     customers
-- WHERE    score != 0
-- ORDER BY country DESC, score ASC;
-- SELECT   country,
--          SUM(score) AS total_score,
--          first_name
-- FROM     customers
-- GROUP BY country, first_name;
-- SELECT   country,
--          SUM(score) as total_score
-- FROM     customers
-- GROUP BY country 
-- HAVING  SUM(score) > 800;
-- SELECT   country,
--          AVG(score) AS avarage_score
-- FROM     customers
-- WHERE    score != 0
-- GROUP BY country
-- HAVING   AVG(score) > 450;

-- SELECT DISTINCT country 
-- FROM customers;

SELECT   TOP 3 *
FROM     customers
ORDER BY score DESC;