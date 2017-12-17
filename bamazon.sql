DROP DATABASE IF EXISTS bamazon_DB;

CREATE DATABASE bamazon_DB;

USE bamazon_DB;

CREATE TABLE products (
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NULL,
  department_name VARCHAR(100) NULL,
  price DECIMAL(10, 4) NULL,
  stock_quantity INTEGER(200) NULL,
  PRIMARY KEY (item_id)
);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Kitten Mittens", "Accesories", "10.00", 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Volleyball", "Sports", "5.95", 3);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Sega Genesis", "Video Games", "20.00", 1);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Scott Pilgrim Vs. The World", "DVDs", "4.60", 2);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Kombucha Brewing Kit", "Food", "10.00", 5);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Hair Ties", "Accesories", "10.00", 50);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Snowboard", "Sports", "100.00", 7);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Flour", "Food", "1.99", 55);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Dump Trump Sticker", "Accesories", "1.00", 75);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Scott Pilgrim Vs. The World Game", "Video Games", "10.00", 5);
