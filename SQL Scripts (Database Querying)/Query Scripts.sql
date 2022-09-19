--Query 01 - SQL Script to combine two tables [Person] and [Address]
select FirstName, LastName, City, State from Person LEFT JOIN Address
ON Person.PersonId = Address.PersonId

--Query 02 - Define function to obtain the Nth Highest in a series as an integer using DENSE_RANK Function. Ensure that the column(s) being queried contain integer values as stated in the function
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      WITH NthHightest_CTE AS 
      (SELECT Salary, DENSE_RANK() OVER(ORDER BY Salary DESC) AS rnk
      FROM Employee)
      SELECT Salary FROM NthHightest_CTE
      WHERE rnk = N limit 1
      
      
  );
END

--Query 03 - SQL Script to obtain consecutive numbers in a column using LEAD and LAG Functions
WITH Consecutive_CTE(Num, leadNum, lagNum) AS
(SELECT Num, LEAD(Num) OVER(ORDER BY Id), LAG(Num) OVER(ORDER BY Id) FROM Logs)

SELECT DISTINCT Num as ConsecutiveNums
FROM Consecutive_CTE 
WHERE Num = leadNum
AND Num = lagNum

--Query 04 - SQL Script to define customers who never made an order, combining tables of the [Customer_ID] and [Orders]
WITH ORDER_CUSTOMERS_CTE(CustomerId) AS
(SELECT Customers.Id from Customers INNER JOIN Orders
WHERE Customers.Id = Orders.CustomerId)

SELECT Name as Customers from Customers c
where c.Id NOT IN (SELECT CustomerId from ORDER_CUSTOMERS_CTE)

--Query 05 - Find users with duplicate emails
SELECT Email from Person 
GROUP BY Email
HAVING Count(Email) > 1

--Query 06 - Delete duplicate emails found in the table
WITH DUPLICATE_CTE AS
(SELECT MIN(Id) AS Uni_Id
FROM Person
GROUP BY Email)

DELETE FROM Person 
WHERE Id NOT IN (SELECT Uni_Id FROM DUPLICATE_CTE)
