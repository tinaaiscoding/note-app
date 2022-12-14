get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  email = params['email']
  password = params['password']

  user = find_user_by_email(email)

  if user && BCrypt::Password.new(user['password_digest']) == password
    session['user_id'] = user['id']
    user_id = session['user_id']
    redirect '/'
    erb '/', locals: {
      user_id: user_id
    }
  else
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session['user_id'] = nil
  
  redirect '/'
end