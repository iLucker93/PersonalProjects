require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative 'headline_scraper'

@scraper = HeadlineScraper.new("http://www.reddit.com/r/ruby")

CSV.open("my_file.csv", "w") do |csv|
    @scraper.get_headlines('p.tagline a.author').each do |link|
        csv.puts [link.content, link["href"]]
    end
end