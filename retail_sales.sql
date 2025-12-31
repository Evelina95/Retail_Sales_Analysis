SELECT * FROM evelina_db.retail_sales;
/*Who spends the most/least?*/
SELECT 
    customer_id,
    SUM(total_amount) AS total_spent,
    MIN(total_amount) AS least_spent
FROM evelina_db.retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC, least_spent ASC
LIMIT 51;
/*NOTE: Top 50 clients who spent the most, advise: to send an appreciation letter and 
Top product suggestions considering client's
purchases*/
/*Least total_spent clients. NOTE: Send a discount via email for attracting the buyers*/

/*Woman or Men?*/
SELECT gender,
       COUNT(transaction_id) AS orders,
       SUM(total_amount) AS total_spent
FROM evelina_db.retail_sales
GROUP BY gender;
/*Females dominates. NOTE: check the females and males assortment, 
It may need the assortment extraction for males*/
/*Favorite categories by clients*/
SELECT product_category,
       SUM(total_amount) AS total_spent,
       AVG(total_amount) AS avg_spent
FROM evelina_db.retail_sales
GROUP BY product_category
ORDER BY total_spent DESC;
/*Most spent on Electronics(more expensive than other categories), least Beauty products. 
In general sales amount almost equally
distributed by category.*/ 
/*Sales by date*/

SELECT
  substr(trim(date), 1, 7) AS date,
  SUM(total_amount) AS total_spent
FROM evelina_db.retail_sales
GROUP BY substr(trim(date), 1, 7)
ORDER BY date desc;
/*The lowest profit of 2023 was in September and the highest in May.
 My advice to check the seasonal products.
it may have an influence on the sales*/