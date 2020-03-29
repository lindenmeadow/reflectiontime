class ReflectionsController < ApplicationController
  get '/reflections' do
    if logged_in?
      @reflections = Reflection.all
      erb :'reflections/index'
    else
      redirect '/login'
    end
  end

  get '/reflections/new' do
    if logged_in?
      erb :'reflections/new'
    else
      redirect '/login'
    end
  end

  post '/reflections' do
    if logged_in?
        @reflection = Reflection.create(
          student_name: params[:student_name],
          block: params[:block],
          teacher_name: params[:teacher_name],
          project_name: params[:project_name],
          project_type: params[:project_type],
          conduct: params[:conduct],
          leadership: params[:leadership],
          work: params[:work],
          creativity: params[:creativity],
          collaboration: params[:collaboration],
          thinking: params[:thinking],
          communication: params[:communication],
          comments: params[:comments]
          )
        @reflection.user_id = current_user.id
        @reflection.save
        redirect "/reflections/#{@reflection.id}"
      else
        redirect '/login'
      end
  end

  get '/reflections/:id' do
    if logged_in?
      @reflection = Reflection.find_by_id(params[:id])
      erb :'reflections/show'
    else
      erb :'users/login'
    end
  end

  get '/reflections/:id/edit' do
    if logged_in?
      @reflection = Reflection.find(params[:id])
      if @reflection.user_id == current_user.id
        erb :'reflections/edit'
      else
        redirect '/login'
      end
    else
      redirect '/'
    end
  end

  patch '/reflections/:id' do
    @reflection = Reflection.find_by_id(params[:id])
    @reflection.update(
    student_name: params[:student_name],
    block: params[:block],
    teacher_name: params[:teacher_name],
    project_name: params[:project_name],
    project_type: params[:project_type],
    conduct: params[:conduct],
    leadership: params[:leadership],
    work: params[:work],
    creativity: params[:creativity],
    collaboration: params[:collaboration],
    thinking: params[:thinking],
    communication: params[:communication],
    comments: params[:comments]
    )
    redirect "/reflections/#{@reflection.id}"
  end

  delete '/reflections/:id' do
    if logged_in?
      @reflection = Reflection.find(params[:id])
      if @reflection.user_id == current_user.id
        @reflection.destroy
      end
      erb :'users/show'
    else
      redirect '/'
    end
  end
end
