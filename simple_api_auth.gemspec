# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "simple_api_auth"
  s.version     = "0.0.5"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wen-Tien Chang"]
  s.email       = ["ihower@gmail.com"]
  s.homepage    = "https://github.com/ihower/simple_api_auth"
  s.summary     = %q{Simple API Key Authentication}
  s.description = %q{A Rack middleware and Railtie(for Rails3) for API key authentication.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "rack"
  s.add_development_dependency "rspec", "~> 2.5"
  s.add_development_dependency "json"
end
