require 'sinatra'
require 'erb'
require_relative 'twitter_wrapper'

set :port, '3456'
set :bind, '0.0.0.0'
set :server, 'webrick'

get '/' do
  @my_name = "Joseph"
  @my_things = ["Move to the western USA", "Get to enjoy more outdoor activities", "Become a developer"]
  erb :index, layout: :bootstrap
end

get '/tweet_us' do
  twitter = TwitterWrapper.new(ENV['CONFIG_CONSUMER_KEY'], ENV['CONFIG_CONSUMER_SECRET'])
  @tweets = twitter.search("kittens").take(10).collect do |tweet|
    tweet.text
  end
  erb :tweet_us, layout: :bootstrap
end