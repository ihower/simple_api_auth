# Simple API Key Authentication

A Rack middleware and Railtie(for Rails3) for API key authentication.
It will authenticate all requests to /api/*
  
## Usage

### Gemfile

  gem "simple_api_auth"

### config/api_key.yml

  api_key: you_api_key

### Generate a random API key

  rake generate

### Run spec

  bundle exec rspec spec

## License

Copyright © 2011 Wen-Tien Chang
Licensed under the MIT: http://www.opensource.org/licenses/mit-license.php