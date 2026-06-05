CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY(order_id, product_id),
    FOREIGN KEY(order_id)
    REFERENCES Orders(order_id),
    FOREIGN KEY(product_id)
    REFERENCES Products(product_id)
);

INSERT INTO Customers VALUES
(1,'Vishwanth','Warangal'),
(2,'Hiran','Karimnagar'),
(3,'Sathwik','Hanamkonda'),
(4,'Sai','Hyderabad'),
(5,'Gayathri','Banglore');

INSERT INTO Products VALUES
(101,'Laptop','Electronics',60000),
(102,'Smartphone','Electronics',30000),
(103,'Camera','Electronics',25000),
(104,'Keyboard','Accessories',1500),
(105,'Monitor','Electronics',12000);

INSERT INTO Orders VALUES
(1001,1,'2025-01-10'),
(1002,2,'2025-01-15'),
(1003,1,'2025-02-05'),
(1004,3,'2025-02-20'),
(1005,4,'2025-03-01');

INSERT INTO Order_Items VALUES
(1001,101,1),
(1001,103,2),

(1002,102,1),

(1003,105,1),
(1003,104,2),

(1004,102,2),
(1004,103,1),

(1005,101,1),
(1005,105,1);


/* Top-Selling Products */

SELECT
    p.product_id,
    p.name,
    SUM(oi.quantity) AS total_quantity_sold
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.name
ORDER BY total_quantity_sold DESC;

/* Most Valuable Customers */

SELECT
    c.customer_id,
    c.name,
    SUM(oi.quantity * p.price) AS total_spent
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

/* Monthly Revenue Calculation */

SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(oi.quantity * p.price) AS revenue
FROM Orders o
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY YEAR(o.order_date),
         MONTH(o.order_date)
ORDER BY year, month;

/*Category-Wise Sales Analysis */

SELECT
    p.category,
    SUM(oi.quantity * p.price) AS category_revenue
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

/* Detect Inactive Customers */

SELECT
    c.customer_id,
    c.name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;