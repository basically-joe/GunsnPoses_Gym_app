DROP TABLE bookings;
DROP TABLE events;
DROP TABLE clients;

CREATE TABLE events (
id SERIAL8 PRIMARY KEY,
title VARCHAR(255),
time_slot VARCHAR(255),
type VARCHAR(255)
);

CREATE TABLE clients (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  age INT4
);

CREATE TABLE bookings (
  id SERIAL8 PRIMARY KEY,
  events_id INT4 REFERENCES events(id),
  bookings_id INT4 REFERENCES events(id)
);
