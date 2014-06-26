#encoding utf-8

require 'twitter'

CONSUMER_KEY        = ""
CONSUMER_SECRET     = ""
ACCESS_TOKEN        = ""
ACCESS_TOKEN_SECRET = ""

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

clientst = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = CONSUMER_KEY
  config.consumer_secret     = CONSUMER_SECRET
  config.access_token        = ACCESS_TOKEN
  config.access_token_secret = ACCESS_TOKEN_SECRET
end

clientst.user do |object|
	case object
	when Twitter::Tweet
		sn = object.user.screen_name
		tweet = object.text
		puts tweet
		if tweet =~ /@NHN お話しよう/
			`saykana いいですねおはなししましょう。`
		end
	when Twitter::DirectMessage
		puts "It's a direct message!"
	when Twitter::Streaming::StallWarning
		warn "Falling behind!"
	end
end