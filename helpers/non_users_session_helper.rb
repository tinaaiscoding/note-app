def new_session?
  if session[:non_user]
    return false
  else 
    return true
  end
end
  