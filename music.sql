-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name TEXT not NULL UNIQUE
);



CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);


CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    release_date DATE NOT NULL
);


CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id,_id INT REFERENCES albums(id) ON DELETE CASCADE
);

CREATE TABLE song_artists (
    id SERIAL PRIMARY KEY,
    song_id INT REFERENCES songs(id) ON DELETE CASCADE,
    artists_id INT REFERENCES artists(id) ON DELETE CASCADE,
    PRIMARY KEY (song_id, artists_id)
);


CREATE TABLE song_produce (
    song_id INT REFERENCES songs(id) ON DELETE CASCADE,
    Producer_id INT REFERENCES producers(id) ON DELETE CASCADE,
    PRIMARY KEY (song_id, Producer_id)
    /*var3 type3*/
);

INSERT INTO artists (name) 
VALUES
    ('Hanson'),
    ('Queen'),
    ('Mariah Carey'),
    ('Boyz II Men'),
    ('Lady Gaga'),
    ('Bradley Cooper'),
    ('Nickelback'),
    ('Jay Z'),
    ('Alicia Keys'),
    ('Katy Perry'),
    ('Jucy J'),
    ('Maroon 5'),
    ('Christina Agulera'),
    ('Avril Lavigne'),
    ('Destiny\'s 'child');


INSERT INTO producers (name) 
VALUES
    ('Dust Brothers'),
    ('Stephen Lironi'),
    ('Roy Thomas Baker'),
    ('Walter Afansieff'),
    ('Benjamin Rice'),
    ('Al Shux'),
    ('Max Martin'),
    ('Cirkut'),
    ('Shellback'),
    ('Benny Blanco'),
    ('The Matrix'),
    ('Darkchild')


INSERT INTO songs (title, duration_in_seconds, album_id)
VALUES
    ('MMMBop', 238, 1),
    ('Bohemian Rhapsody', 355, 2),
    ('One Sweet Day', 282, 3),
    ('Shallow', 216, 4),
    ('How You Remind Me', 223, 5),
    ('New York State of Mind', 276, 6),
    ('Dark Horse', 215, 7),
    ('Moves Like Jagger', 201, 8),
    ('Complicated', 244, 9),
    ('Say My Name', 240, 10);


INSERT INTO song_artists (song_id, artists_id)
VALUES
    (1, 1), -- Hanson
    (2, 2), -- Queen
    (3, 3), -- Mariah Carey
    (3, 4), -- Boyz II Men
    (4, 5), -- Lady Gaga
    (4, 6), -- Bradley Cooper
    (5, 7), -- Nickelback
    (6, 8), -- Jay Z
    (6, 9), -- Alicia Keys
    (7, 10), -- Katy Perry
    (7, 11), -- Juicy J
    (8, 12), -- Maroon 5
    (8, 13), -- Christina Aguilera
    (9, 14), -- Avril Lavigne
    (10, 15); -- Destiny's Child


INSERT INTO song_produce (song_id,Producer_id) 
VALUES
    (1, 1), -- Dust Brothers
    (1, 2), -- Stephen Lironi
    (2, 3), -- Roy Thomas Baker
    (3, 4), -- Walter Afanasieff
    (4, 5), -- Benjamin Rice
    (5, 6), -- Rick Parashar
    (6, 7), -- Al Shux
    (7, 8), -- Max Martin
    (7, 9), -- Cirkut
    (8, 10), -- Shellback
    (8, 11), -- Benny Blanco
    (9, 12), -- The Matrix
    (10, 13); -- Darkchild
    