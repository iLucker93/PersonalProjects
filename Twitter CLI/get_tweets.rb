require 'twitter'

# Authentication details from twitter, your starting
# point is here: https://dev.twitter.com/apps/new
@client = Twitter::REST::Client.new do |config|
  config.consumer_key    = ENV['CONFIG_CONSUMER_KEY']
  config.consumer_secret = ENV['CONFIG_CONSUMER_SECRET']
  config.access_token 	 = ENV['CONFIG_ACCESS_TOKEN']
  config.access_token_secret = ENV['CONFIG_ACCESS_TOKEN_SECRET']
end

puts "What do you want to do?"
input = gets.chomp

case input
	when "New"
		puts "What do you want to tweet?"
		tweet = gets.chomp
		@client.update("#{tweet}")
		puts "Tweeted #{tweet} successfully!"
	when "Search"
		puts "What are you searching for? Will display 10 most recent tweets."
		search = gets.chomp
		client.search("#{search}", :result_type => "recent").take(10).collect do |tweet|
		puts "#{tweet.user.screen_name}: #{tweet.text}"
	end
end