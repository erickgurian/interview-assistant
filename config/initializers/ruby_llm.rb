RubyLLM.configure do |config|
  # config.openai_api_key = ENV.fetch("OPENAI_API_KEY", Rails.application.credentials.dig(:openai_api_key))
  config.gemini_api_key = ENV.fetch("GEMINI_API_KEY", Rails.application.credentials.dig(:gemini_api_key))

  config.default_model = "gemini-2.5-flash"

  # Use the association-based acts_as API (recommended)
  config.use_new_acts_as = true
end
