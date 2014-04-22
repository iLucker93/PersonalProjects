require 'nokogiri'
require 'open-uri'

class HeadlineScraper

	def initialize(url)
		@doc = Nokogiri::HTML(open(url))
	end

	def get_headlines(target)
		@doc.css(target)
	end
end