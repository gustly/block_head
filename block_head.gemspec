# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'block_head/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'mail'

  spec.name          = "block_head"
  spec.version       = BlockHead::VERSION
  spec.authors       = ["Joe Letizia", "Noah Gordon", "Gust"]
  spec.email         = ["joe@gust.com", "noah@gust.com", "devs@gust.com"]
  spec.summary       = %q{BlockHead prevents you from being a blockhead. You can specify a set of domains that emails may be sent to from a Rails application.}
  spec.description   = %q{BlockHead provides an interceptor that can be used to restrict emails sent from a Rails application to a specific set of domains. Just set two environment variables -- the whitelisted domains and a bucket to collect redirected emails.}
  spec.homepage      = "http://gust.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
