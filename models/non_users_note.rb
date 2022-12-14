def all_non_user_note
  run_sql('SELECT * FROM non_user_notes ORDER BY id')
end

def create_non_user_note(date, title, note, note_type)
  run_sql('INSERT INTO non_user_notes(date, title, note, note_type) VALUES($1, $2, $3, $4)', [date, title, note, note_type])
end

def get_non_user_note(id)
  run_sql('SELECT * FROM non_user_notes WHERE id = $1', [id])[0]
end

def update_non_user_note(id, date, title, note)
  run_sql('UPDATE non_user_notes SET date = $2, title = $3, note = $4 WHERE id = $1', [id, date, title, note])
end

def delete_non_user_note(id)
  run_sql('DELETE FROM non_user_notes WHERE id = $1', [id])
end