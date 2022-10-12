-- To create label table
CREATE TABLE labels (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
)

-- To create book table
CREATE TABLE books (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  author_id INT,
  genre_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY(author_id) REFERENCES authors(id),
  FOREIGN KEY(genre_id) REFERENCES genres(id),
  FOREIGN KEY(label_id) REFERENCES labels(id),
)