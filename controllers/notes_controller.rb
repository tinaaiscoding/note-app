################ INDEX #################
get '/' do
  notes = all_notes()
  
  erb :'/notes/index', locals: {
    notes: notes
  }
end

################ NOTES #################
get '/new-note' do
  erb :'/notes/new-note'
end

post '/notes-new' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "note"
  temp_note = false
  
  create_note(date, title, note, note_type, temp_note)

  redirect '/'
end

#### LIST ####
get '/new-list' do
  erb :'/notes/new-list'
end

post '/notes-list' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "list"

  create_note(date, title, note, note_type)

  redirect '/'
end

#### EDIT ####
get '/notes/:id/edit' do
  id = params['id']
  note = get_note(id)

  erb :'notes/edit', locals: {
    note: note
  }
end

put '/notes/:id' do
  id = params['id']
  date = params['date']
  title = params['title']
  note = params['note']

  update_note(id, date, title, note)

  redirect '/'
end

#### DELETE ####
delete '/notes/:id' do
  id = params['id']

  delete_note(id)

  redirect '/'
end

################ TEMP NOTES #################
get '/notes/temp-index' do
  notes = all_notes()

  erb :'notes/temp-index', locals: {
    notes: notes
  }
end

get '/new-temp-note' do
  erb :'notes/new-temp-note'
end

get '/new-temp-list' do
  erb :'notes/new-temp-list'
end

post '/temp-notes-new' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "note"
  temp_note = true

  create_note(date, title, note, note_type, temp_note)

  redirect '/notes/temp-index'
end

get '/notes/:id/edit-temp-note' do
  id = params['id']
  date = params['date']
  title = params['title']
  note = params['note']

  update_note(id, date, title, note)

  redirect '/notes/temp-index'
end

delete '/notes/:id/delete-temp-note' do
  id = params['id']

  delete_note(id)

  redirect '/notes/temp-index'
end

#### 'BACK TO HOME' BTN FROM TEMP NOTE DASHBOARD ####
delete '/temp-notes' do
  delete_all_temp_note
  redirect '/'
end