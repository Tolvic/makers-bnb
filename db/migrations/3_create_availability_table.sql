CREATE TABLE availability (id SERIAL PRIMARY KEY,
  spaces_id INT REFERENCES spaces(id),
  available_dates DATE);
