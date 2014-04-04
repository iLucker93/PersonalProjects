require 'sinatra'
require 'erb'

set :port, 3456
set :bind, '0.0.0.0'

get '/' do
	@myname = "Joe"
    erb :index, layout: :bootstrap
end

get '/tweet_us' do
    erb :tweet_us, layout: :bootstrap
end

get '/home' do
	"Hello from \/home!"
end