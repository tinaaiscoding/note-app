     
require 'sinatra'
require './db/db'

get '/' do
  notes = run_sql('SELECT * FROM notes ORDER BY id')
  
  erb :'/notes/index', locals: {
    notes: notes
  }
end

get '/new-note' do
  erb :'/notes/new-note'
end

get '/new-list' do
  erb :'/notes/new-list'
end

post '/notes-new' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "note"

  run_sql('INSERT INTO notes(date, title, note, note_type) VALUES($1, $2, $3, $4)', [date, title, note, note_type])

  redirect '/'
end

post '/notes-list' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "list"

  run_sql('INSERT INTO notes(date, title, note, note_type) VALUES($1, $2, $3, $4)', [date, title, note, note_type])

  redirect '/'
end

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

delete '/notes/:id' do
  id = params['id']

  run_sql('DELETE FROM notes WHERE id = $1', [id])

  redirect '/'
end


