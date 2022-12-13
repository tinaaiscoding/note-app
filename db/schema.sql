CREATE DATABASE project2_notes_app_db;
\c project2_notes_app_db

CREATE TABLE notes(
  id SERIAL PRIMARY KEY,
  date TEXT,
  title TEXT,
  note TEXT,
  favourite BOOLEAN DEFAULT FALSE
);

INSERT INTO notes(date, title, note) VALUES('11/12/22', 'Test', 'This is a test note. Hello world, how are you today? It''s currently raining outside');

ALTER TABLE notes ADD note_type TEXT;

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT, 
    email TEXT
);

ALTER TABLE users ADD COLUMN password_digest TEXT;