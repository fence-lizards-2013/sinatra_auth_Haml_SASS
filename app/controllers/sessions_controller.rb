get '/login' do
  # render sign-in page
  haml :"sessions/login"
end

post '/login' do
  @user = User.find_by_username(params[:username])
  if @user.password == params[:password]
    session[:user] = @user.id
    redirect '/'
  else
    @error = "Incorrect Email/Password Combination"
    haml :"sessions/login"
  end
end

delete '/logout' do
  session.clear
  redirect '/'
  # sign-out -- invoked via AJAX
end



## DELETE ONCE AJAX IS IMPLEMENTED FOR LOGGING OUT
get '/logout' do
  session.clear
  redirect '/'
end

