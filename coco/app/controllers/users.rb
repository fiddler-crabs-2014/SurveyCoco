get '/login' do
  erb :login
end

post '/user_verification' do
   @email = params[:email]
   @password = params[:password]
   @user = User.authenticate(@email,@password)

   if @user
     session[:user_id] = @user.id
     redirect '/profile/' + @user.id.to_s
   else
     redirect '/'
   end
end

get '/register' do
  erb :register
end

post '/create_user' do
  @user = User.create({name: params[:name], email: params[:email], password: params[:password]})
  session[:user_id] = @user.id
  puts @user.id
  redirect '/profile/' + @user.id.to_s
end

get '/profile/:user_id' do
  @user = User.find(params[:user_id])
  if @user.id == session[:user_id]
    @surveys = Survey.where(user_id: params[:user_id])
    erb :profile
  else
    erb :fail
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
