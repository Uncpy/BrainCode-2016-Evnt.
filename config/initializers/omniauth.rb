Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1013671735373321', '33bddcb10bc908fb6ec9489f5cc0d5f4'
end