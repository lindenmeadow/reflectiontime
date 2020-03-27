class UsersController < ApplicationController

  get '/users/:id' do
    if logged_in?
      erb :'users/show'
    else
      redirect to '/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect to '/reflections'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:username] == '' || params[:password] == ''
      redirect '/signup'
    else
      @user = User.create(name: params[:name], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/reflections'
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
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/reflections'
   else
     erb :'users/login', locals: {message: "Username and/or password is incorrect. Try again."}
   end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
