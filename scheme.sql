CREATE TABLE  Item (
    id INT
    genre = VARCHAR(55)
    author = VARCHAR(55)
    label = VARCHAR(55)
    publish_date = DATE
    archived = BOOLEAN DEFAULT FALSE
    can_be_archived = BOOLEAN DEFAULT
    move_to_archive = BOOLEAN
    add_label INTEGER REFERENCES Label(id),
    add_genre INTEGER REFERENCES Genre(id),
    add_author INTEGER REFERENCES Author(id)
)
-- create games table
CREATE TABLE game(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publish_date DATE,
  multiplayer VARCHAR(80),
  last_played_at DATE 
  author_id INT REFERENCES author(id), 
);

-- Create authors table
CREATE TABLE author(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR(80),
  last_name VARCHAR(80)
);

-- Create music_albums table
create table music_albums(
  id serial not null primary key,
  archived boolean,
  publish_date date,
  on_spotify boolean
);

-- Create genres table
create table genres(
  id serial not null primary key,
  name varchar(100)
);

-- Create labels table
CREATE TABLE LABEL(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255),
);

-- Create books table
CREATE TABLE BOOK(
  id INTEGER GENERATED ALWAYS AS INDENTITY PRIMARY KEY,
  publish_date DATE,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  genre_id INT,
  author_id INT,
  label_id INT,
  CONSTRAINT fk_book_genre FOREIGN KEY (genre_id) REFERENCES GENRES(id),
  CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES AUTHORS(id),
  CONSTRAINT fk_book_label FOREIGN KEY (label_id) REFERENCES LABELS(id),
);