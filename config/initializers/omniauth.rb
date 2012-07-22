Rails.application.config.middleware.use OmniAuth::Builder do
  provider :osm, ENV['MOBILE_OSM_HOUSE_NUMBER_EDITOR_CONSUMER_KEY'], ENV['MOBILE_OSM_HOUSE_NUMBER_EDITOR_CONSUMER_SECRET']
end
