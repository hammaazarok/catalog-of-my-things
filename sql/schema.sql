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
  publisher VARCHAR(100),
  cover_state BOOLEAN,
  FOREIGN KEY(author_id) REFERENCES authors(id),
  FOREIGN KEY(genre_id) REFERENCES genres(id),
  FOREIGN KEY(label_id) REFERENCES labels(id)
 )
 
CREATE TABLE authors (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100)
)

CREATE TABLE games (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    author_id int,
    genre_id int,
    label_id int,
    publish_date Date,
    archived boolean,
    multiplayer boolean,
    last_played_at Date,
    FOREIGN KEY(author_id) REFERENCES authors(id),
    FOREIGN KEY(genre_id) REFERENCES genres(id),
    FOREIGN KEY(label_id) REFERENCES labels(id)
)

CREATE TABLE genres (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(100)
)

CREATE TABLE musicalbum (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    author_id INT,
    genre_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    on_spotify BOOLEAN,
    FOREIGN KEY(author_id) REFERENCES authors(id),
    FOREIGN KEY(genre_id) REFERENCES genres(id),
    FOREIGN KEY(label_id) REFERENCES labels(id)
)