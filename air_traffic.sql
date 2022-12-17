-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic



CREATE TABLE Airlines
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE routes
(
  id SERIAL PRIMARY KEY,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL,
  airline_id INTEGER REFERENCES Airlines
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES Airlines,
  route_id INTEGER REFERENCES routes
);


INSERT INTO Airlines
  (airline)
VALUES
  ('United'), 
  ('British Airways'),
  ('Delta'), 
  ('TUI Fly Belgium'), 
  ('Air China'), 
  ('American Airlines'), 
  ('Avianca Brasil');
  


INSERT INTO routes
  (from_city, from_country, to_city, to_country, airline_id)
VALUES
  ('Washington DC', 'United States', 'Seattle', 'United States',1),
  ('Tokyo', 'Japan', 'London', 'United Kingdom',2),
  ('Los Angeles', 'United States', 'Las Vegas', 'United States',3),
  ('Seattle', 'United States', 'Mexico City', 'Mexico',3),
  ('Paris', 'France', 'Casablanca', 'Morocco',4),
  ('Dubai', 'UAE', 'Beijing', 'China',5),
  ('New York', 'United States', 'Charlotte', 'United States',1),
  ('Cedar Rapids', 'United States', 'Chicago', 'United States',6),
  ('Charlotte', 'United States', 'New Orleans', 'United States',6),
  ('Sao Paolo', 'Brazil', 'Santiago', 'Chile',7);

INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, route_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00',1,1) ,
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00',2,2), 
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00',3,3), 
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00',3,4), 
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00',4,5), 
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00',5,6), 
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00',1,7), 
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00',6,8), 
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00',6,9), 
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00',7,10);