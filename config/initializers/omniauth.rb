Rails.application.config.middleware.use OmniAuth::Builder do
  provider :osm, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
end
