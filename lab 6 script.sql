-- інформація про працівників + пошта
SELECT 
    LPAD(employee_id, 5, '0') AS "Employee ID",
    CONCAT(last_name, ' ', first_name) AS "Full Name",
    CONCAT(LOWER(first_name), '.', LOWER(last_name), '@company.com') AS "Email"
FROM 
    Employee;


-- іінформація про праціавників + дата найму + час роботи 
SELECT 
    first_name AS "First Name",
    last_name AS "Last Name",
    DATE_FORMAT(employment_date, '%d-%m-%Y') AS "Hire Date",
    TIMESTAMPDIFF(YEAR, employment_date, CURDATE()) AS "Years of Service"
FROM 
    Employee;


-- мін та макс зп 
SELECT 
    MIN(salary) AS "Minimum Salary",
    MAX(salary) AS "Maximum Salary"
FROM 
    Employee;


-- середній бонус для людей з бонусами
SELECT 
    AVG(bonus) AS "Average Bonus (with Bonuses)"
FROM 
    Employee
WHERE 
    bonus IS NOT NULL;


-- середній бонус по компанії 
SELECT 
    AVG(IFNULL(bonus, 0)) AS "Average Bonus (Company-wide)"
FROM 
    Employee;


-- к-ть працівників в компанії 
SELECT 
    COUNT(*) AS "Total Employees"
FROM 
    Employee;


-- к-ть працівників з бонусами 
SELECT 
    COUNT(*) AS "Employees with Bonuses"
FROM 
    Employee
WHERE 
    bonus IS NOT NULL;


-- вакансії та департаментами 
SELECT 
    d.department_name AS "Department",
    COUNT(DISTINCT d.department_id) AS "Total Departments",
    COUNT(DISTINCT d.city) AS "Total Offices",
    e.position AS "Position",
    COUNT(*) AS "Number of Employees"
FROM 
    Employee e
JOIN 
    Department d ON e.department_id = d.department_id
GROUP BY 
    d.department_name, e.position;


-- працівники з продажами, відсортовані за депами 
SELECT 
    d.department_name AS "Department",
    e.position AS "Position",
    COUNT(*) AS "Number of Employees with Sales"
FROM 
    Employee e
JOIN 
    Department d ON e.department_id = d.department_id
JOIN 
    Invoice i ON e.employee_id = i.employee_id
GROUP BY 
    d.department_name, e.position
HAVING 
    COUNT(i.invoice_id) > 5;


-- інформація про продукт 
SELECT 
    LPAD(product_id, 4, '0') AS "Product ID",
    CONCAT(manufacturer, ' :: ', SUBSTRING_INDEX(product_name, '/', 1)) AS "Product Name",
    UPPER(CONCAT(product_type, ' - ', category)) AS "Category"
FROM 
    Product
ORDER BY 
    manufacturer;


-- продажі за місяць false
SELECT 
    LPAD(MONTH(MIN(order_datetime)), 2, '0') AS "Month",
    SUM(quantity * price) AS "Total Revenue",
    CONCAT('Quarter ', QUARTER(MIN(order_datetime)), ' - ', YEAR(MIN(order_datetime))) AS "Sales Period"
FROM 
    Orders
JOIN 
    Product ON Orders.product_id = Product.product_id
GROUP BY 
    YEAR(order_datetime), MONTH(order_datetime)
ORDER BY 
    YEAR(order_datetime), MONTH(order_datetime);



-- продукти, у яких більш ніж 50000 у revenue false
SELECT 
    p.product_name AS "Product Name",
    SUM(o.quantity * p.price) AS "Total Revenue"
FROM 
    Orders o
JOIN 
    Product p ON o.product_id = p.product_id
GROUP BY 
    p.product_name
HAVING 
    SUM(o.quantity * p.price) > 500;


-- топ 10 покупців false
SELECT 
    c.first_name AS "First Name", 
    c.last_name AS "Last Name", 
    SUM(o.amount) AS "Total Revenue"
FROM 
    Customer c
JOIN 
    Orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    SUM(o.amount) DESC
LIMIT 10;



-- 