CREATE TABLE spaces (id SERIAL PRIMARY KEY,
  user_id INT,
  space_name VARCHAR(80),
  description VARCHAR(360),
  price_per_night INT);
