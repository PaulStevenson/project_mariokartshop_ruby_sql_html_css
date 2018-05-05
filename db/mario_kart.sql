DROP TABLE  items;
DROP TABLE suppliers;

CREATE TABLE suppliers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE items (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  quantity INT2,
  purchase_cost INT2,
  RRP INT2,
  category VARCHAR(255),
  supplier_id INT8 references supplier(id)
);
