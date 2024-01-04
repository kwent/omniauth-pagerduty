# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-pagerduty/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Bleigh"]
  gem.email         = ["michael@intridea.com"]
  gem.description   = %q{Official OmniAuth strategy for PagerDuty.}
  gem.summary       = %q{Official OmniAuth strategy for PagerDuty.}
  gem.homepage      = "https://pagerduty.com/intridea/omniauth-pagerduty"
  gem.license       = "MIT"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-pagerduty"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::PagerDuty::VERSION

  gem.required_ruby_version = ">= 3"

  gem.add_dependency 'omniauth', '~> 2.0.0'
  gem.add_dependency 'omniauth-oauth2', '>= 1.4.0', '< 2.0'

  gem.add_development_dependency 'rspec', '~> 3.5'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
