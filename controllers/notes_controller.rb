################ INDEX #################
get '/' do
  notes = all_notes()
  
  erb :'/notes/index', locals: {
    notes: notes
  }
end

################ NOTES #################
get '/notes/new-note' do
  erb :'/notes/new-note'
end

post '/notes/new-note' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "note"
  temp_note = false
  user_id = session['user_id'].to_i
  favourite = params['favourite']
  
  create_note(date, title, note, note_type, temp_note, user_id, favourite)

  redirect '/'
end

#### LIST ####
get '/notes/new-list' do
  erb :'/notes/new-list'
end

post '/notes/new-list' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "list"
  temp_note = false
  user_id = session['user_id'].to_i
  favourite = params['favourite']

  create_note(date, title, note, note_type, temp_note, user_id, favourite)

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

#### FAVOURITE ####
put '/notes/fav' do
  favourite
  redirect '/'
end

put '/notes/:id/fav' do
  id = params['id']

  favourite_note('t' ,id)

  redirect '/'
end

put '/notes/:id/nofav' do
  id = params['id']

  favourite_note('f' ,id)

  redirect '/'
end

