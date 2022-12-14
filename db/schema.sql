CREATE DATABASE project2_notes_app_db;
\c project2_notes_app_db

CREATE TABLE notes(
  id SERIAL PRIMARY KEY,
  date TEXT,
  title TEXT,
  note TEXT,
  favourite BOOLEAN DEFAULT FALSE,
  temp_note BOOLEAN DEFAULT FALSE,
  user_id INTEGER,
  note_type TEXT
);

INSERT INTO test(date, title, note) VALUES( 'Test', 'This is a test note. Hello world, how are you today? It''s currently raining outside');

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT, 
    email TEXT,
    password_digest TEXT
);

-- ADD TO SERVER DATABASE