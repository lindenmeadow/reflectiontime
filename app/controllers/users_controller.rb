class UsersController < ApplicationController

  get '/users/:id' do
    if logged_in?
      erb :'users/show'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/reflections'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:name] == '' || params[:password] == '' || User.find_by(:name => params[:name])
      erb :'users/signup', locals: {message: "Missing input or username already taken. Try again."}
    else
      @user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = @user.id
      redirect '/reflections'
    end
  end

  get '/login' do
    if logged_in?
      erb :'users/show'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/reflections'
   else
    erb :'users/login', locals: {message: "Incorrect username or password. Try again."}
   end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/login'
    else
      redirect '/'
    end
  end

  get '/users/:id/edit' do
    if logged_in?
      erb :'users/edit'
    else
      redirect '/login'
    end
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update(name:params[:name], password:params[:password])
    redirect '/users/show'
  end

end
