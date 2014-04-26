# require the file that sets everything up
require_relative 'boot'

get '/todos' do
	@todos = ToDo.all
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