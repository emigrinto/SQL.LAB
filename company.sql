CREATE TABLE [Department] (
	[department_id] int NOT NULL UNIQUE,
	[department_name] nvarchar(50) NOT NULL,
	[location] nvarchar(100) NOT NULL,
	PRIMARY KEY ([department_id])
);

CREATE TABLE [Employee] (
	[employee_id] int NOT NULL UNIQUE,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[position] nvarchar(20) NOT NULL,
	[salary] float(53) NOT NULL,
	[department_id] int NOT NULL,
	[manager_id] int,
	[rate] float(53) NOT NULL,
	[bonus] float(53),
	PRIMARY KEY ([employee_id])
);

CREATE TABLE [Customer] (
	[customer_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[first_name] nvarchar(30) NOT NULL,
	[last_name] nvarchar(30) NOT NULL,
	[gender] nvarchar(1) NOT NULL,
	[phone_number] nvarchar(15) NOT NULL,
	[email] nvarchar(50) NOT NULL,
	[discount] int,
	PRIMARY KEY ([customer_id])
);

CREATE TABLE [Product] (
	[product_id] int NOT NULL UNIQUE,
	[product_name] nvarchar(50) NOT NULL,
	[product_description] nvarchar(150) NOT NULL,
	[category] nvarchar(30) NOT NULL,
	[manufacturer] nvarchar(50) NOT NULL,
	[product_type] nvarchar(30) NOT NULL,
	[amount] int NOT NULL,
	[price] float(53) NOT NULL,
	PRIMARY KEY ([product_id])
);

CREATE TABLE [Orders] (
	[orders_id] int IDENTITY(1,1) NOT NULL UNIQUE,
	[employee_id] int NOT NULL,
	[product_id] int NOT NULL,
	[customer_id] int NOT NULL,
	[transaction_type] nvarchar(20) NOT NULL,
	[transaction_moment] datetime NOT NULL,
	[amount] int NOT NULL,
	PRIMARY KEY ([orders_id])
);


ALTER TABLE [Employee] ADD CONSTRAINT [Employee_fk5] FOREIGN KEY ([department_id]) REFERENCES [Department]([department_id]);

ALTER TABLE [Employee] ADD CONSTRAINT [Employee_fk6] FOREIGN KEY ([manager_id]) REFERENCES [Employee]([employee_id]);


ALTER TABLE [Orders] ADD CONSTRAINT [Orders_fk1] FOREIGN KEY ([employee_id]) REFERENCES [Employee]([employee_id]);

ALTER TABLE [Orders] ADD CONSTRAINT [Orders_fk2] FOREIGN KEY ([product_id]) REFERENCES [Product]([product_id]);

ALTER TABLE [Orders] ADD CONSTRAINT [Orders_fk3] FOREIGN KEY ([customer_id]) REFERENCES [Customer]([customer_id]);