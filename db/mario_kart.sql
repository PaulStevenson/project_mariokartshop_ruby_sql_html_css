DROP TABLE orders;
DROP TABLE customers;
DROP TABLE items;
DROP TABLE  suppliers;

CREATE TABLE suppliers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  location VARCHAR(255),
  representative VARCHAR(255)
);

CREATE TABLE items (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  quantity INT2,
  purchase_cost INT2,
  rrp INT2,
  category VARCHAR(255),
  supplier_id INT8 REFERENCES suppliers(id)
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  contact VARCHAR(255)
);
CREATE TABLE orders (
  id SERIAL8 PRIMARY KEY,
  item_id INT8 REFERENCES items(id),
  customer_id INT8 REFERENCES customers(id)
)
