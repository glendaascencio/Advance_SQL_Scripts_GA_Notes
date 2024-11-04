# Select all customer data that have a gmail address
SELECT first_name, last_anme. email_address
FROM customers
WHERE email_address LIKE '%@gmail.com';

# Using the constraint function to ensure data integrity
CREATE TABLE table_name (
	id INT PRIMARY KEY,
	salary INT CHECK (salary >0),
	hire_date DATE CHECK (hire_date >= '1940-01-01')
);

# Calculate average card usage per month
SELECT id, 
	EXTRACT(MONTH FROM transtion_date) as month
	AVG(transation_cost) as avg_transtion
FROM card
GROUP BY month, id;

# Calcuate Click-Through-Rate (CTR) for Marketing Campaigns
	# CTR is the ratio of the number of clicks to the number of views, expressed as  a percentage
SELECT A.campaing_id,
	A.channel,
	(SUM(CASE WHEN B.action = 'Clicked' THEN 1 ELSE 0 END)/
		NULLIF(SUM(CASE WHEN B.ACTION = 'viewed' THEN 1 ELSE 0 END), 0)) * 100
	AS CTR,
FROM channel A 
inner join action B
	on a.campaing_id = b.campaing_id
group by A.campaing_id, A.channel;

# Disinction Between Cross Join and Natural Join 
	# Cross join (Cartesian product)
	# Natural join (based on common columns)
SELECT products.name as product,
	colors.name as colors
FROM products
CROSS JOIN colors;

SELECT *
FROM table_name_A A
LEFT JOIN table_name_B B
	ON A.id = B.id 
Where B.id is null;

# Implement tracking tools to monitor user progress through each step.
	# Record the users interaction and note where they abandon the process
SELECT step, count(user_id) as user_cnt
FROM user_tracking
WHERE flow_name = 'checkout'
GROUP BY step
ORDER BY step;
  
#Select all records where the first letter of the City is an "a" or a "c" or an "s".
SELECT * FROM Customers
WHERE City LIKE '[acs]%';

#Select all records where the second letter of the City is an "a".
SELECT * FROM Customers
WHERE City LIKE '_a%';

#Select all records where the first letter of the City starts with anything from an "a" to an "f".
SELECT * FROM Customers
WHERE City LIKE '[a-f]%';

#Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

SELECT * FROM Customers
WHERE City LIKE '[!acf]%';

#The DELETE statement is used to delete existing records in a table. DELETE Syntax
DELETE FROM table_name WHERE condition;
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

#Return all products with a higher price than the average price:
SELECT * FROM Products
WHERE price > (SELECT AVG(price) FROM Products);

#Return all customers from a city that starts with 'L' followed by one wildcard character, then 'nd' and then two wildcard characters:

SELECT * FROM Customers
WHERE city LIKE 'L_nd__';

#The % wildcard represents any number of characters, even zero characters.
#Return all customers that starts with "b" and ends with "s":

SELECT * FROM Customers
WHERE CustomerName LIKE 'b%s';

#Return all customers that have an order in the Orders table:

SELECT * FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

#Return all customers that have NOT placed any orders in the Orders table:

SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

#Alieas
SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

# Alias and contat function in SQL
SELECT CustomerName, CONCAT(Address,', ',PostalCode,', ',City,', ',Country) AS Address
FROM Customers;

