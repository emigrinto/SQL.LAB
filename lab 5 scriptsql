-- список всіх менеджерів (чому не відображаються менеджери?)
SELECT 
    employee_id AS "Manager ID",
    last_name AS "Manager Last Name",
    first_name AS "Manager First Name",
    position AS "Manager Title",
    employment_date AS "Manager Hire Date"
FROM 
    Employee
WHERE 
    position IN ('CEO', 'Manager');


-- всі співробітники та їх менеджери
SELECT 
    e.employee_id AS "Employee ID",
    e.last_name AS "Employee Last Name",
    e.first_name AS "Employee First Name",
    e.position AS "Employee Title",
    e.employment_date AS "Hire Date",
    m.employee_id AS "Manager ID",
    m.last_name AS "Manager Last Name",
    m.first_name AS "Manager First Name",
    m.position AS "Manager Title",
    m.employment_date AS "Manager Hire Date"
FROM 
    Employee e
JOIN 
    Employee m ON e.manager_id = m.employee_id;


-- всі співробітники та їх департаменти
SELECT 
    e.employee_id AS "Employee ID",
    e.last_name AS "Employee Last Name",
    e.first_name AS "Employee First Name",
    e.position AS "Employee Title",
    d.department_name AS "Department Name"
FROM 
    Employee e
JOIN 
    Department d ON e.department_id = d.department_id;


-- співробітники, які мають продажі 
SELECT 
    e.employee_id AS "Employee ID",
    e.last_name AS "Employee Last Name",
    e.first_name AS "Employee First Name",
    e.position AS "Employee Title",
    i.invoice_id AS "Invoice",
    i.transaction_moment AS "Transaction Moment"
FROM 
    Employee e
JOIN 
    Invoice i ON e.employee_id = i.employee_id;


-- співробітники, які зробили продажі, з допомогою natural join
SELECT 
    employee_id AS "Employee ID",
    last_name AS "Employee Last Name",
    first_name AS "Employee First Name",
    position AS "Employee Title",
    invoice_id AS "Invoice",
    transaction_moment AS "Transaction Moment"
FROM 
    Employee
NATURAL JOIN 
    Invoice;


-- співробітники, які зробили продажі, та їх покупці 
SELECT 
    e.employee_id AS "Employee ID",
    e.last_name AS "Employee Last Name",
    e.first_name AS "Employee First Name",
    i.invoice_id AS "Invoice",
    i.transaction_moment AS "Transaction Moment",
    c.customer_id AS "Customer ID",
    c.last_name AS "Customer Last Name",
    c.first_name AS "Customer First Name"
FROM 
    Employee e
JOIN 
    Invoice i ON e.employee_id = i.employee_id
JOIN 
    Customer c ON i.customer_id = c.customer_id;


-- продажі неавторизованим покупцям
SELECT 
    e.employee_id AS "Employee ID",
    e.last_name AS "Employee Last Name",
    e.first_name AS "Employee First Name",
    i.invoice_id AS "Invoice",
    i.transaction_moment AS "Transaction Moment"
FROM 
    Employee e
JOIN 
    Invoice i ON e.employee_id = i.employee_id
LEFT JOIN 
    Customer c ON i.customer_id = c.customer_id
WHERE 
    i.customer_id IS NULL;


-- орг структура компанії 
SELECT 
    e.employee_id AS "Employee ID",
    e.last_name AS "Employee Last Name",
    e.first_name AS "Employee First Name",
    e.position AS "Employee Title",
    d.department_name AS "Department Name"
FROM 
    Employee e
JOIN 
    Department d ON e.department_id = d.department_id;


-- список співробітників - консультантів 
SELECT 
    employee_id AS "Employee ID",
    last_name AS "Last Name",
    first_name AS "First Name",
    'Can Consult' AS "Consulting Status"
FROM 
    Employee
WHERE 
    position = 'Consultant'

UNION

SELECT 
    employee_id AS "Employee ID",
    last_name AS "Last Name",
    first_name AS "First Name",
    'Cannot Consult' AS "Consulting Status"
FROM 
    Employee
WHERE 
    position != 'Consultant';


-- продукти та їх покупці
SELECT 
    o.orders_id AS "Orders ID",
    p.product_name AS "Product Name",
    p.category AS "Product Category",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction Moment",
    c.last_name AS "Customer Last Name",
    c.first_name AS "Customer First Name"
FROM 
    Orders o
JOIN 
    Product p ON o.product_id = p.product_id
JOIN 
    Invoice i ON o.invoice_id = i.invoice_id
JOIN 
    Customer c ON i.customer_id = c.customer_id
ORDER BY 
    o.orders_id;


-- працівники департаменту Меркурій, та продані ними продукти з липня по жовтень 2023 
SELECT 
    o.orders_id AS "Orders ID",
    p.product_name AS "Product Name",
    p.category AS "Product Category",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction Moment",
    c.last_name AS "Customer Last Name",
    c.first_name AS "Customer First Name"
FROM 
    Orders o
JOIN 
    Product p ON o.product_id = p.product_id
JOIN 
    Invoice i ON o.invoice_id = i.invoice_id
JOIN 
    Customer c ON i.customer_id = c.customer_id
JOIN 
    Employee e ON i.employee_id = e.employee_id
JOIN 
    Department d ON e.department_id = d.department_id
WHERE 
    d.department_name = 'Mercury'
    AND i.transaction_moment BETWEEN '2023-07-01' AND '2023-10-01'
ORDER BY 
    o.orders_id;


-- всі покупці (без покупок також), і продажі без авторизованих покупців 
SELECT 
    c.customer_id AS "Customer ID",
    c.last_name AS "Last Name",
    c.first_name AS "First Name",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction Moment"
FROM 
    Customer c
LEFT JOIN 
    Invoice i ON c.customer_id = i.customer_id

UNION

SELECT 
    c.customer_id AS "Customer ID",
    c.last_name AS "Last Name",
    c.first_name AS "First Name",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction Moment"
FROM 
    Invoice i
LEFT JOIN 
    Customer c ON i.customer_id = c.customer_id

ORDER BY 
    4; -- відсортували за інвойс айді, бо він четвертий у коді

