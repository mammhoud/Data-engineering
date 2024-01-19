select 
emp.FirstName as Employee_FirstName,
emp.LastName as Employee_LastName,
-- concat(emp.firstname," ",emp.lastname) as name, 
count(ord.employeeid) as Number_of_Orders
from w3schools.employees as emp
left join w3schools.orders ord on ord.employeeid = emp.employeeid
group by emp.employeeid
order by Number_of_orders desc
limit 10;




select emp.firstname as Employee_FirstName, emp.lastname as Employee_LastName, 
-- COALESCE(sum(odd.quantity), 0) as Sold_Most_Beverages
case when sum(odd.quantity) is NULL then 0 
    else sum(odd.Quantity) end as Sold_Most_Beverages
--
from w3schools.employees as emp
left join w3schools.orders as ord on emp.EmployeeID = ord.EmployeeID
left join w3schools.order_details as odd on odd.OrderID = ord.OrderID
right join w3schools.products as prd on odd.productid = prd.ProductID
where prd.CategoryID in (select cat.CategoryID from w3schools.categories as cat where cat.CategoryName = "beverages")
group by emp.employeeid
order by sold_most_beverages desc
limit 10;