--1. Create a view [sales_info] based on the orders, order_items,
--and products tables
CREATE VIEW SALES_INFOO
AS
SELECT PR.product_id,SO.order_id,SO.customer_id,PR.product_name,SO.order_date,SO.shipped_date,OI.list_price
FROM PRODUCTION.products as PR 
INNER JOIN SALES.order_items as OI
ON PR.product_id = OI.product_id 
INNER JOIN SALES.orders as SO
ON OI.order_id = SO.order_id

-----CALLING VIEW SALES_INFO
SELECT * FROM SALES_INFOO;

--2. Create a view [staff_sales] based on order_items,orders,staffs to display sales
---info along with (order value) for all staff group by first_name,last_name
CREATE VIEW STAFF_SALES
AS
SELECT ST.FIRST_NAME,ST.LAST_NAME,SUM(OI.QUANTITY * OI.LIST_PRICE) AS 'ORDER VALUE'
FROM 
SALES.ORDER_ITEMS OI 
INNER JOIN SALES.ORDERS SO
ON OI.order_id = SO.order_id
INNER JOIN SALES.STAFFS ST
ON ST.staff_id = SO.staff_id
GROUP BY ST.FIRST_NAME,ST.LAST_NAME;

------CALLING VIEW STFF_SALES--------
SELECT * FROM STAFF_SALES;

---3.Create a stored procedure [usp_add_store] to insert data into stores table and
----return count of store using output parameter.
CREATE PROCEDURE USP_ADD_STORE
@STORE_NAME VARCHAR(50),
@PHONE VARCHAR(20),
@EMAIL VARCHAR(50),
@STREET VARCHAR(50),
@CITY VARCHAR(50),
@STATE VARCHAR(50),
@ZIP_CODE VARCHAR(20),
@STORE_COUNT INT OUTPUT
AS
BEGIN
INSERT INTO SALES.STORES(STORE_NAME,PHONE,EMAIL,STREET,CITY,STATE,ZIP_CODE)
	VALUES(@STORE_NAME,@PHONE,@EMAIL,@STREET,@CITY,@STATE,@ZIP_CODE)
	SELECT @STORE_COUNT = COUNT(*) FROM SALES.STORES;
END;


DECLARE @COUNT INT;
EXEC  USP_ADD_STORE
@STORE_NAME = 'JOHN BIKES',
@PHONE = '6532489523',
@EMAIL = 'john@bikes.shop',
@STREET = 'MARINE DRIVE',
@CITY = 'BOMBAY',
@STATE = 'MH',
@ZIP_CODE = '56163',

-----CALLING PROCEDURE USP_ADD_STORE----
@STORE_COUNT = @COUNT OUTPUT
SELECT @COUNT AS 'STORE_COUNT'
SELECT * FROM SALES.STORES;

---4.Create a stored procedure [usp_store_wise_sales] to display store wise sales
---(store_id,store_name,city,order count) information based on stores,orders group
---by store id .
ALTER PROCEDURE USP_STORE_WISE_SALES
AS
BEGIN
	SELECT SS.STORE_ID,SS.STORE_NAME,SS.CITY,COUNT(ORDER_ID) AS 'ORDER COUNT'
	FROM SALES.STORES SS INNER JOIN SALES.ORDERS SO
	ON SS.STORE_ID = SO.STORE_ID
	GROUP BY SS.STORE_ID,SS.STORE_NAME,SS.CITY 
END;

------CALLING PROCEDURE USP_STORE_WISE_SALES-----
EXEC  USP_STORE_WISE_SALES


--------------------Q.5---------------------------
CREATE FUNCTION SALES.UDF_ORDER_PLACED(
@CUSTOMER_ID INT,
@YEAR INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @ORDER_COUNT DECIMAL(10,2)
SELECT @ORDER_COUNT = SUM(QUANTITY * LIST_PRICE)
FROM SALES.ORDER_ITEMS OI INNER JOIN SALES.ORDERS SO
ON OI.order_id = SO.ORDER_ID
WHERE CUSTOMER_ID = @CUSTOMER_ID
AND YEAR(ORDER_DATE) = @YEAR
   RETURN @ORDER_COUNT
END;


SELECT SALES.UDF_ORDER_PLACED(279,2017) AS 'ORDER SUM'
                                                                                                                                              