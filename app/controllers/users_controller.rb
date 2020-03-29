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
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/reflections'
   else
    redirect 'login'
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
    redirect "/users/edit"
  end

  delete '/users/:id' do
    if logged_in?
      current_user.delete
      redirect "/logout"
    else
      redirect '/login'
    end
  end

end
