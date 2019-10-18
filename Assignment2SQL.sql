--1.  Write a query to display customer list by the first name in descending order.
SELECT * FROM SALES.CUSTOMERS
ORDER BY FIRST_NAME DESC;

--2.Write a query to display the first name, last name, and city of the customers. It
--sorts the customer list by the city first and then by the first name.
SELECT FIRST_NAME,LAST_NAME,CITY
FROM SALES.CUSTOMERS
ORDER BY CITY,FIRST_NAME;

--3.Write a query to returns the top three most expensive products.
SELECT TOP(3) PRODUCT_ID,PRODUCT_NAME,LIST_PRICE AS EXPENSIVE_PRODUCTS
 FROM PRODUCTION.PRODUCTS
ORDER BY LIST_PRICE DESC

--4. Query to finds the products whose list price is greater than 300 and
--model year is 2018.
SELECT PRODUCT_ID,PRODUCT_NAME,MODEL_YEAR,LIST_PRICE
 FROM PRODUCTION.PRODUCTS
WHERE LIST_PRICE > 300
AND MODEL_YEAR = 2018;

--5.. Write a query to finds products whose list price is greater than 3,000 or model
--year is 2018. Any product that meets one of these conditions is included in the
--result set.
SELECT PRODUCT_ID,PRODUCT_NAME,MODEL_YEAR,LIST_PRICE 
FROM PRODUCTION.PRODUCTS
WHERE LIST_PRICE > 3000
OR MODEL_YEAR = 2018;

--6.Write a query to find the products whose list prices are between 1,899 and
--1,999.99.
SELECT PRODUCT_ID,PRODUCT_NAME,LIST_PRICE
FROM PRODUCTION.PRODUCTS
WHERE LIST_PRICE BETWEEN 1899 AND 1999.99;


---7.Write a query uses the IN operator to find products whose list price is 299.99 or
--466.99 or 489.99.
SELECT PRODUCT_ID,PRODUCT_NAME,LIST_PRICE
FROM PRODUCTION.PRODUCTS
WHERE LIST_PRICE IN(299.99,466.99,489.99);

---8.Write a query to the customers where the first character in the last name is the
--letter in the range A through C:
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME
FROM SALES.CUSTOMERS
WHERE LAST_NAME LIKE '[A-C]%' ;

--9.. Write a query using NOT LIKE operator to find customers where the first
--character in the first name is not the letter A:
SELECT CUSTOMER_ID,FIRST_NAME,LAST_NAME
FROM SALES.CUSTOMERS
WHERE FIRST_NAME NOT LIKE 'A%' ;

--10.Write a query to return the number of customers by state and city group state
--and city.
SELECT STATE,CITY,COUNT(CUSTOMER_ID) AS NO_OF_CUSTOMERS
FROM SALES.CUSTOMERS
GROUP BY STATE,CITY;

--11.Write a query to return the number of orders placed by the customer group by
---customer id and year.
SELECT CUSTOMER_ID,YEAR(ORDER_DATE) AS 'YEAR',COUNT(ORDER_ID) AS NO_OF_ORDERS_PLACED
FROM SALES.ORDERS
GROUP BY CUSTOMER_ID,YEAR(ORDER_DATE);


--12.Write query to finds the maximum and minimum list group by category id.
--Then, it filters out the category which has the maximum list price greater than
--4,000 or the minimum list price less than 500
SELECT CATEGORY_ID,MAX(LIST_PRICE) AS MAX_LIST_PRICE,
MIN(LIST_PRICE) AS MIN_LIST_PRICE
FROM PRODUCTION.PRODUCTS
GROUP BY CATEGORY_ID
HAVING MAX(LIST_PRICE) > 4000 OR
MIN(LIST_PRICE) < 500;
