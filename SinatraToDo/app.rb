# require the file that sets everything up
require_relative 'boot'

get '/todos' do
	@todos = ToDo.order('completed')
	erb :index, layout: :bootstrap
end

get '/todos/new' do
	@todos = ToDo.new
	erb :new, layout: :bootstrap
end

post '/todos' do
	@post = ToDo.create(params[:todo])
	redirect '/todos'
end

post '/delete-todo' do
	@the_todo = ToDo.find(params[:todo][:id])
	@the_todo.completed = true
	@the_todo.save
	redirect '/todos'
end