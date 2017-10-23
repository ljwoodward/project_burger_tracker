DROP TABLE burgers_deals;
DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE visits;
DROP TABLE eateries;
DROP TABLE users;


CREATE TABLE users (
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE eateries (
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  url VARCHAR(255)
);

CREATE TABLE visits (
  id SERIAL8 primary key,
  user_id INT8 REFERENCES users(id),
  eatery_id INT8 REFERENCES eateries(id)
);

CREATE TABLE burgers (
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  price FLOAT,
  eatery_id INT8 REFERENCES eateries(id)
);

CREATE TABLE deals (
  id SERIAL8 primary key,
  name VARCHAR(255),
  day VARCHAR,
  discount INT8,
  eatery_id INT8 REFERENCES eateries(id)
);

CREATE TABLE burgers_deals (
  id SERIAL8 primary key,
  burger_id INT8 REFERENCES burgers(id),
  deal_id INT8 REFERENCES deals(id)
);
