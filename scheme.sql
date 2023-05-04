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
