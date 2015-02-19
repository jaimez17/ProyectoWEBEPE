OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['1413314268965344'], ENV['4c5dbe3bfe4394201e42ce192e8e3de8']
  provider :facebook, ENV['1413314268965344'], ENV['4c5dbe3bfe4394201e42ce192e8e3de8'], :display => "popup"
end