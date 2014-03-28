require 'rest-client'

puts "What are we doing? Options are: Search or Heroku. Search will search google, Heroku will ping your heroku app to keep it alive (if it's on the 1 dyno plan)"

input = gets.chomp.downcase

case input
	when "search"
		puts "What do you want to search for?"
		search = gets.chomp
		result = RestClient.get 'http://www.google.com/#q=' << "#{search}"
		puts result.to_s
		puts "This is the source of your search result page converted entirely to strings."
	when "heroku"
		puts "Whats the name of your app? Just the part before .herokuapp.com"
		name = gets.chomp.downcase
		result = RestClient.get '.herokuapp.com'.prepend("#{name}")
		puts result.to_s
		puts "This is your app's landing page, in source, all strings"
end