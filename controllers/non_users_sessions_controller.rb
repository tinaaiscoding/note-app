get '/sessions/new-non-users' do
  notes = all_non_user_note()

  erb :'/sessions/non-users-index', locals: {
    non_user_notes: notes
  }
end


delete '/non_users_sessions' do
  session[:non_user] = nil
  note_add_count = 0
  p note_add_count
  redirect '/'
end