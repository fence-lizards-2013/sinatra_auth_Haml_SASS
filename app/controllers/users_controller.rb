get '/signup' do
  # render sign-up page
  haml :"users/signup"
end

post '/signup' do
  # sign-up a new user
  @user = User.new(params['user'])

  if @user.valid?
    @user.save
    session[:user] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    haml :"users/signup"
  end
end
