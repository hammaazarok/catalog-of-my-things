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
    FOREIGN KEY(label_id) REFERENCES labels(id),
)