USE company;
SELECT
*
FROM
Employee;-- Завдання 1: вивести всі дані з таблиці customer відсортувавши їх за прізвищем
SELECT 
*
FROM 
Customer
ORDER BY
last_name ASC;

-- Завдання 2: вивести унікальних manufacturers з таблиці продуктів, впорядкувати за алфавітом
SELECT DISTINCT 
Manufacturer 
FROM 
Product
ORDER BY 
Manufacturer ASC;

-- Завдання 3: отримати інформацію про продукти (назва_продукту, виробник, категорія, тип_продукту, ціна),вироблені компанією 'DELL', з таблиці продуктів, впорядкувати за назвою продукту в алфавітному порядку
SELECT 
product_name,
manufacturer, 
product_type,
price 
FROM 
Product
WHERE 
Manufacturer = 'DELL'
ORDER BY 
product_name ASC;

-- Завдання 4: отримати інф. про клієнтів-жінок 1990-2000 років народження (ім^я, прізвище, стать, дата
-- народження, номер телефону) з таблиці customer в одному запиті, відсортовану за прізвищем в
-- алфавітному порядку
SELECT 
first_name, 
last_name, 
gender, 
birth_date,
phone_number 
FROM 
Customer 
WHERE 
gender = 'F'
AND 
birth_date 
BETWEEN 
'1990-01-01'
AND 
'2000-12-31'
ORDER BY 
last_name ASC; 

-- Завдання 5: отримати інформацію з таблиці product про наявні на складі ноутбуки, які оснащені дисковими
-- накопичувачами об^ємом 512 ГБ.
SELECT 
* 
FROM 
Product 
WHERE
category = 'NOTEBOOK' 
AND
product_description 
LIKE 
'%512GB%'
ORDER BY 
product_name ASC; 

-- Завдання 6: отримати інф. з таблиці product про наявні на складі ноутбуки або настільні комп^ютери, які
-- оснащені дисковими накопичувачами 512 ГБ або 1 ТБ
SELECT 
* 
FROM 
Product 
WHERE 
category = 'NOTEBOOK'
OR 
category LIKE 'D%'
AND 
product_description 
LIKE 
'%512GB%'
OR
'%1TB%'
ORDER BY 
category ASC; 

-- Завдання 7: отримати інф. з таблиці invoice про всі покупки, зроблені неавторизованими
-- покупцями (customer_id NULL)
SELECT 
* 
FROM 
Invoice 
WHERE 
customer_id 
IS NULL; 
