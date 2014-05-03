get '/login' do
  erb :login
end

post '/user_verification' do
   @email = params[:email]
   @password = params[:password]
   @user = User.authenticate(@email,@password)

   if @user
     session[:user_id] = @user.id
     redirect '/profile/' + @user.id
   else
     redirect '/'
   end
end

get '/register' do
  erb :register
end

post '/create_user' do
  # requires error logic to take into account whether email is already in use
  @user = User.create!({name: params[:name], email: params[:email], password: params[:password]})
  session[:user_id] = @user.id
  redirect '/profile/' + @user.id
end

get '/profile/:user_id' do
  @surveys = Survey.where(user_id: params[:user_id])
  erb :profile
end
