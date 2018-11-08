CREATE TABLE bookings (id SERIAL PRIMARY KEY,
  user_id INT REFERENCES users(id),
  space_id INT REFERENCES spaces(id),
  availability_id INT,
  approval_status VARCHAR(50));
