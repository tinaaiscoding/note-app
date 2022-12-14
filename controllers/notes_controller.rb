################ INDEX #################
get '/' do
  notes = all_note()
  
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

  create_note(date, title, note, note_type)

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