module SimpleApiAuth
  class Railtie < Rails::Railtie
    initializer "simple_api_auth_railtie.configure_rails_initialization" do |config|
      SimpleApiAuth::Middleware.api_key = YAML.load_file("#{Rails.root}/config/api_key.yml")["api_key"]
      config.middleware.use SimpleApiAuth::Middleware          
    end
  end

end