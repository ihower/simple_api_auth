module SimpleApiAuth

  class Middleware

    @@api_path_matcher = /^\/api\//
    @@unauthorized_response = [401, {"Content-Type" => "text/plain"}, ['{ "message": "Unauthenticated." }']]

    def self.api_key=(key)
      @@api_key = key
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      path  = env['PATH_INFO']
      if path =~ @@api_path_matcher
        api_key = env["HTTP_AUTHORIZATION"] || Rack::Request.new(env).params['api_key']
        unless api_key == @@api_key
          env['rack.errors'].write "throw 401 from SimpleApiAuth. got api_key: #{api_key.inspect} \n"
          return @@unauthorized_response
        end
      end

      @app.call(env)
    end

  end

  def self.generate(length = 40)
    require "digest/sha1"
    Digest::SHA1.hexdigest(Time.now.to_s + rand(99999999).to_s)[0..length-1]
  end

end
