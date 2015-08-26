class TaskManagerApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i , params[:task])
    redirect "tasks/#{id}"
  end

  get '/tasks' do
    @tasks = TaskManager.all  #instance variable w/ 3 strings
    erb :index                            #render index.erb
  end

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  delete "/tasks/:id" do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end
end
