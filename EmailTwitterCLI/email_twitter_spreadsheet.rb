require 'csv'
require 'twitter'
require 'mailgun'

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
		@client.search("#{search}", :result_type => "recent").take(10).collect do |tweet|
		puts "#{tweet.user.screen_name}: #{tweet.text}"
		CSV.open("my_results.csv", "wb") do |csv|
			csv << ["#{tweet.user.screen_name}"]
			csv << ["#{tweet.text}"]
		end
	@my_file = File.open("my_results.csv")
	end
end

@mailgun = Mailgun(:api_key => ENV['MAILGUN_API_KEY'], :domain => 'sandbox65328.mailgun.org')

parameters = {
  :to => "zkay@mail.com",
  :subject => "missing tps reports",
  :text => "yeah, we're gonna need you to come in on friday...yeah.",
  :from => "postmaster@sandbox65328.mailgun.org",
  :attachment => @my_file
}

@mailgun.messages.send_email(parameters)