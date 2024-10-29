USE company;

ALTER TABLE Orders
ADD COLUMN invoice_id INT,
ADD COLUMN order_datetime DATETIME,
ADD COLUMN quantity INT,
DROP COLUMN transaction_type,
DROP COLUMN transaction_moment,
DROP COLUMN amount;

ALTER TABLE Customer
MODIFY COLUMN phone_number VARCHAR(15);

ALTER TABLE Employee
MODIFY COLUMN position VARCHAR(50);

CREATE TABLE IF NOT EXISTS Invoice (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

ALTER TABLE Orders
ADD CONSTRAINT Orders_fk4 FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id);

ALTER TABLE Department
MODIFY COLUMN location VARCHAR(100) DEFAULT 'Default City';

ALTER TABLE Employee
ADD UNIQUE (user_name);

SELECT * FROM Customer;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Orders;
SELECT * FROM Product;
SELECT * FROM Invoice;
