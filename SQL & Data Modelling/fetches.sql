select 
emp.FirstName as Employee_FirstName,
emp.LastName as Employee_LastName,
count(ord.employeeid) as Number_of_Orders
from w3schools.employees as emp
inner join w3schools.orders ord on ord.employeeid = emp.employeeid
group by emp.employeeid
order by Number_of_orders desc
limit 10;

--------------------

select emp.firstname as Employee_FirstName, emp.lastname as Employee_LastName, 
  sum(odd.Quantity) as Sold_Most_Beverages
from w3schools.order_details as odd
inner join w3schools.orders as ord on odd.OrderID = ord.OrderID
inner join w3schools.products as prd on odd.productid = prd.ProductID
inner JOIN w3schools.categories AS cat ON prd.CategoryID = cat.CategoryID and cat.CategoryName = "beverages"
inner join w3schools.employees as emp on emp.EmployeeID = ord.EmployeeID

group by emp.employeeid
order by sold_most_beverages desc
limit 10;
