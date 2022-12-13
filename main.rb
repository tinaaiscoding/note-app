     
require 'sinatra'
require './db/db'

################ INDEX #################
get '/' do
  notes = run_sql('SELECT * FROM notes ORDER BY id')
  
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

  run_sql('INSERT INTO notes(date, title, note, note_type) VALUES($1, $2, $3, $4)', [date, title, note, note_type])

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

  run_sql('INSERT INTO notes(date, title, note, note_type) VALUES($1, $2, $3, $4)', [date, title, note, note_type])

  redirect '/'
end

#### EDIT ####
get '/notes/:id/edit' do
  id = params['id']
  note = run_sql('SELECT * FROM notes WHERE id = $1', [id])[0]
  p note
  erb :'notes/edit', locals: {
    note: note
  }

end

put '/notes/:id' do
  id = params['id']
  date = params['date']
  title = params['title']
  note = params['note']

  run_sql('UPDATE notes SET date = $2, title = $3, note = $4 WHERE id = $1', [id, date, title, note])

  redirect '/'
end

#### DELETE ####
delete '/notes/:id' do
  id = params['id']

  run_sql('DELETE FROM notes WHERE id = $1', [id])

  redirect '/'
end

################ USERS #################

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  first_name = params['first_name']
  last_name = params['last_name']
  email = params['email']

  run_sql("INSERT INTO users(first_name, last_name, email) VALUES($1, $2, $3)", [first_name, last_name, email])

  redirect '/'
end