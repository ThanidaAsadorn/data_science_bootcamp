CREATE TABLE restaurant_customer
	(id INT,
     customer_name text,
     city text,
			chef_name text); 
     
INSERT INTO restaurant_customer VALUES
	(1, 'Mariana', 10119548, 'Claudio'),
    (2, 'Isabel', 19486445, 'Claudio'),
    (3, 'Juan', 49456637, 'Tanuccia'),
    (4, 'Daniel', 48390003, 'Luis'),
    (5, 'Sebastien', 58211643, 'Tanuccia');

CREATE TABLE restaurant_menu
	(id int,
     menu_name text,
     chef_name,
     cost real,
     selling_price real);
     
INSERT INTO restaurant_menu VALUES
	(1, 'Tortellini al pesto', 'Claudio', 8, 22),
    (2, 'Spaghetti al carbonara', 'Mariantonetta', 5, 20),
    (3, 'Fettucini alfreddo', 'Luis', 3, 15),
    (4, 'Pizza patatine fritte', 'Tanuccia', 7, 18),
    (5, 'Insalata al olio di olive', 'Tanuccia', 2, 15),
    (6, 'Lasagne al pomodoro con carne', 'Claudio', 14, 25),
    (7, 'Tiramisu', 'Antonio', 4, 12),
    (8, 'Funghi arrosti', 'Claudio', 1, 8),
    (9, 'Tutti frutti', 'Gemella', 6, 15),
    (10, 'Pizza con prociutto crutto', 'Luis', 10, 20);

CREATE TABLE restaurant_sales
	(id int,
     menu_name text,
     menu_count real,
     total real);

INSERT INTO restaurant_sales VALUES
	(1, 'Tortellini al pesto', 15, 15*22),
    (2, 'Spaghetti al carbonara', 8, 8*20),
    (3, 'Fettucini alfreddo', 5, 5*15),
    (4, 'Pizza patatine fritte', 16, 16*18),
    (5, 'Insalata al olio di olive', 28, 28*15),
    (6, 'Lasagne al pomodoro con carne', 11, 11*25),
    (7, 'Tiramisu', 38, 38*12),
    (8, 'Funghi arrosti', 10, 10*8),
    (9, 'Tutti frutti', 27, 27*15),
    (10, 'Pizza con prociutto crutto', 22, 22*20);


-- subquery, with, join, aggregate function 
/* SELECT * FROM restaurant_menu;
SELECT * FROM restaurant_customer;
SELECT * FROM restaurant_sales; */

-- AGGREGATE FUNCTIONS
/* SELECT 
	COUNT(menu_name) AS n_menus,
    AVG(cost) AS avg_cost,
    SUM(cost) AS sum_cost,
    MIN(cost) AS min_cost,
    MAX(cost) AS max_cost
FROM restaurant_menu; */

--JOIN
/* SELECT 
	menu.id,
    menu.menu_name,
    menu.cost,
    sales.menu_count,
    menu.selling_price * sales.menu_count AS Total,
    menu.chef_name
FROM restaurant_menu AS menu
JOIN restaurant_sales AS sales
	ON menu.menu_name = sales.menu_name
ORDER BY total DESC; */

-- subquery
/* SELECT * FROM
	(SELECT menu_name, chef_name 
     FROM restaurant_menu 
     WHERE cost > 6)
WHERE chef_name LIKE 'C%'or chef_name LIKE '%a'; */

-- with 
WITH table1 AS
	(SELECT * FROM restaurant_sales),
    table1_1 AS
    (SELECT * FROM restaurant_menu WHERE cost > 5)
SELECT 
	table1.menu_name,
    table1_1.cost
FROM table1
JOIN table1_1
ON table1.menu_name = table1_1.menu_name;
