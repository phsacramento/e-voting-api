Jumpup::Heroku.configure do |config|
  config.app = 'e-voting-api'
end if Rails.env.development?
