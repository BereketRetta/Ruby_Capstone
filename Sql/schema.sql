CREATE DATABASE catalog_of_things;

CREATE TABLE genre (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE music_album (
  id INT NOT NULL AUTO_INCREMENT,
  publish_date DATE,
  on_spotify BOOLEAN,
  genre_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE author (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE game (
  id INT NOT NULL AUTO_INCREMENT,
  publish_date DATE,
  multiplayer BOOLEAN,
  last_played_at DATE,
  author_id INT,
  PRIMARY KEY(id),
  FOREIGN KEY (author_id) REFERENCES author(id) 
);

CREATE TABLE labels (
  id INT NOT NULL AUTO_INCREMENT,
  color VARCHAR(25),
  title VARCHAR(25),
  PRIMARY KEY(id)
);

CREATE TABLE books (
  id INT NOT NULL AUTO_INCREMENT,
  publisher VARCHAR(50),
  publish_date DATE,
  archived BOOLEAN,
  cover_state VARCHAR(25),
  label_id INT,
  FOREIGN KEY(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);
