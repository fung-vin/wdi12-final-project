Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,       ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook,      ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: "user_posts, publish_actions"
  provider :instagram,     ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
  provider :pinterest,     ENV['PINTEREST_APP_ID'], ENV['PINTEREST_APP_SECRET']
end