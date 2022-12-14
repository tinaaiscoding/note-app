note_add_count = 0
p note_add_count
get '/non-users/new-note' do
  erb :'/non-users/new-note'
end


post '/non-users/notes-new' do
  date = params['date']
  title = params['title']
  note = params['note']
  note_type = "note"

  session[:date] = date
  session[:title] = title
  session[:note] = note
  session[:non_user] = true

  create_non_user_note(date, title, note, note_type)

  note_add_count = note_add_count + 1
  p note_add_count
  redirect '/sessions/new-non-users'
end

get '/non-users-notes/:id/edit' do
  id = params['id']
  note = get_non_user_note(id)

  erb :'/non-users/edit'
end

put '/non-users-notes/:id' do
  id = params['id']
  date = params['date']
  title = params['title']
  note = params['note']
  
  pdate_non_user_note(id, date, title, note)

  redirect '/sessions/new-non-users'
end

delete '/non-users-notes/:id' do
  id = params['id']

  delete_non_user_note(id)

  redirect '/sessions/new-non-users'
end

