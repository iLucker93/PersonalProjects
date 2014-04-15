require 'twitter'

class TwitterWrapper 
    
  def initialize(key, secret)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key    = key
      config.consumer_secret = secret
    end
  end
            
        
  def search(term)
    @client.search(term)
  end
end