get '/sessions/session-index' do
  notes = all_notes()
  
  erb :'/sessions/session-index', locals: {
    notes: notes
  }
end

post '/sessions' do
  email = params['email']
  password = params['password']

  notes = all_notes()
  user = find_user_by_email(email)

  if user && BCrypt::Password.new(user['password_digest']) == password
    session['user_id'] = user['id']
    user_id = session['user_id']
    erb :'/sessions/session-index', locals: {
      user_id: user_id,
      notes: notes
    }
  else
    redirect '/'
  end
end

delete '/sessions' do
  session['user_id'] = nil
  
  redirect '/'
end