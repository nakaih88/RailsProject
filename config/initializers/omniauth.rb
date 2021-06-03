Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [:post, :get]
  provider :google_oauth2, ENV['GOOGLE_CLIENT_KEY'], ENV['GOOGLE_CLIENT_SECRET'], {
  scope: ['email',
    'https://www.googleapis.com/auth/gmail.send'],
    access_type: 'offline'}
end