# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbac/version'

Gem::Specification.new do |spec|
  spec.name          = "rbac"
  spec.version       = Rbac::VERSION
  spec.authors       = ["Sandip Karanjekar"]
  spec.email         = ["sandipkaranjekar@gmail.com"]

  spec.summary       = %q{User interface based role base access control(RBAC) system}
  spec.description   = %q{This gem help you to enable your application with RBAC. This have user interface where you can check which permission assign to role.}
  spec.homepage      = "https://github.com/sandipkaranjekar/rbac"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 12.3.3"
end
