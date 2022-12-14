################ INDEX #################
get '/temp-notes/temp-index' do
  notes = all_notes()

  erb :'/temp-notes/temp-index', locals: {
    notes: notes
  }
end

#### 'BACK TO HOME' BTN FROM TEMP-NOTE INDEX ####
delete '/temp-notes' do
  delete_all_temp_note()
  redirect '/'
end

################ NOTES #################
get '/temp-notes/new-note' do
  erb :'/temp-notes/new-note'
end

post '/temp-notes/new-note' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "note"
  temp_note = true
  user_id = 0

  create_temp_note(date, title, note, note_type, temp_note, user_id)

  redirect '/temp-notes/temp-index'
end

#### LIST ####
get '/temp-notes/new-list' do
  erb :'/temp-notes/new-list'
end

post '/temp-notes/new-list' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "list"
  temp_note = true
  user_id = 0

  create_temp_note(date, title, note, note_type, temp_note, user_id)

  redirect '/temp-notes/temp-index'
end

#### EDIT ####
get '/temp-notes/:id/edit' do
  id = params['id']

  note = get_note(id)

  erb :'/temp-notes/edit', locals: {
    note: note
  }
end

put '/temp-notes/:id' do
  id = params['id']
  date = params['date']
  title = params['title']
  note = params['note']

  update_note(id, date, title, note)

  redirect '/temp-notes/temp-index'
end

#### DELETE ####
delete '/temp-notes/:id/delete' do
  id = params['id']

  delete_note(id)

  redirect '/temp-notes/temp-index'
end