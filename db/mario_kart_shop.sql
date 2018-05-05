DROP TABLE  inventories;
DROP TABLE suppliers;

CREATE TABLE inventories (
  id SERIAL8 primary key,
  name VARCHAR(255),
  description VARCHAR(255),
  quantity INT2,
  purchase_cost INT2,
  RRP INT2,
  category VARCHAR(255),
  supplier_id INT8  references supplier(id)
):

CREATE TABLE suppliers (
  id SERIAL8 primary key,
  name varchar(255)
);
