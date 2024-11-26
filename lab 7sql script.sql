-- max and average salaries
SELECT 
    (SELECT MAX(salary) FROM Employee) AS "Max Salary",
    (SELECT AVG(salary) FROM Employee) AS "Average Salary";



-- info on managers working in lviv 
SELECT * 
FROM Employee e
WHERE e.employee_id IN (
    SELECT DISTINCT manager_id 
    FROM Employee 
    WHERE department_id IN (
        SELECT department_id 
        FROM Department 
        WHERE city = 'Lviv'
    )
);




-- show info on employees that are listed in invoices
SELECT * 
FROM Employee 
WHERE employee_id IN (
    SELECT employee_id 
    FROM Invoice
);



-- analyse company's org chart
SELECT 
    d.department_name AS "Department Name",
    d.city AS "City",
    (SELECT COUNT(*) 
     FROM Employee e 
     WHERE e.department_id = d.department_id) AS "Employees in Department",
    (SELECT COUNT(*) 
     FROM Employee e 
     WHERE e.department_id IN (
         SELECT department_id 
         FROM Department 
         WHERE city = d.city
     )) AS "Employees in City"
FROM Department d;



-- cities that have deps & have more than 5 employees each
SELECT 
    d.city AS "City",
    d.department_name AS "Department Name",
    (SELECT COUNT(*) 
     FROM Employee e 
     WHERE e.department_id = d.department_id) AS "Employees in Department"
FROM Department d
WHERE (SELECT COUNT(*) 
       FROM Employee e 
       WHERE e.department_id = d.department_id) > 5;



-- product name with the smallest quantity 
SELECT * 
FROM Product 
WHERE amount = (SELECT MIN(amount) FROM Product);




-- list managers
SELECT * 
FROM Employee e 
WHERE EXISTS (
    SELECT 1 
    FROM Employee sub 
    WHERE sub.manager_id = e.employee_id
);

-- list mangers, but using null istead of select 1
SELECT * 
FROM Employee e 
WHERE EXISTS (
    SELECT m.manager_id
    FROM Employee m
    WHERE m.manager_id = e.employee_id AND m.manager_id IS NOT NULL
);




-- deps with no employees
SELECT department_name 
FROM Department d 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Employee e 
    WHERE e.department_id = d.department_id
);



-- average salary for employees outside lviv using NOT IN
SELECT AVG(salary) AS "Average Salary"
FROM Employee 
WHERE department_id NOT IN (
    SELECT department_id 
    FROM Department 
    WHERE city = 'Lviv'
);

-- same, but using not exists
SELECT AVG(salary) AS "Average Salary"
FROM Employee e 
WHERE NOT EXISTS (
    SELECT 1 
    FROM Department d 
    WHERE e.department_id = d.department_id 
      AND d.city = 'Lviv'
);



-- avg salary by dep
SELECT 
    d.department_name AS "Department Name",
    AVG(e.salary) AS "Department Avg Salary"
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_id
HAVING AVG(e.salary) < (
    SELECT AVG(salary) 
    FROM Employee 
    WHERE position = position
);



-- deps with avg salary less than companywide for same position
SELECT 
    d.department_name AS "Department Name with Lowest Avg Salary",
    AVG(e.salary) AS "Lowest Avg Salary by Department",
    (SELECT AVG(s.salary) 
     FROM Employee s 
     WHERE s.position = e.position) AS "Company Avg Salary by Position"
FROM Department d
JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_id, e.position
ORDER BY AVG(e.salary) ASC
LIMIT 1;
