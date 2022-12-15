def all_notes
  run_sql('SELECT * FROM notes ORDER BY id')
end

def create_note(date, title, note, note_type, temp_note, user_id, favourite)
  run_sql('INSERT INTO notes(date, title, note, note_type, temp_note, user_id, favourite) VALUES($1, $2, $3, $4, $5, $6, $7)', [date, title, note, note_type, temp_note, user_id, favourite])
end

def create_temp_note(date, title, note, note_type, temp_note, user_id)
  run_sql('INSERT INTO notes(date, title, note, note_type, temp_note, user_id) VALUES($1, $2, $3, $4, $5, $6)', [date, title, note, note_type, temp_note, user_id])
end

def get_note(id)
  run_sql('SELECT * FROM notes WHERE id = $1', [id])[0]
end

def update_note(id, date, title, note)
  run_sql('UPDATE notes SET date = $2, title = $3, note = $4 WHERE id = $1', [id, date, title, note])
end

def delete_note(id)
  run_sql('DELETE FROM notes WHERE id = $1', [id])
end

def delete_all_temp_note
  run_sql("DELETE FROM notes WHERE temp_note = 't'")
end

def favourite_note(boolean, id)
  if boolean == 't'
    run_sql("UPDATE notes SET favourite = 't' WHERE id = $1", [id])
  else 
    run_sql("UPDATE notes SET favourite = 'f' WHERE id = $1", [id])
  end
end

def sort_by_creation
  run_sql('SELECT * FROM notes ORDER BY id')
end

def sort_by_date
  run_sql('SELECT * FROM notes ORDER BY date')
end

def sort_by_favourite
  run_sql('SELECT * FROM notes ORDER BY favourite DESC')
end

def sort_by_latest
  run_sql('SELECT * FROM notes ORDER BY id DESC')
end

def sort_by_title
  run_sql('SELECT * FROM notes ORDER BY title')
end

def note_dates
  run_sql('SELECT date FROM notes ORDER BY id')
end