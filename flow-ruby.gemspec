# frozen_string_literal: true

require_relative "lib/flow/version"

Gem::Specification.new do |spec|
  spec.name          = "flow-ruby"
  spec.version       = Flow::VERSION
  spec.authors       = ["david metta"]
  spec.email         = ["davideliemetta@gmail.com"]

  spec.summary       = "Ruby client for the Flow API."
  spec.description   = "Ruby client for the Flow API."
  spec.homepage      = "https://github.com/davidmetta/flow-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/davidmetta/flow-ruby.git"
  spec.metadata["changelog_uri"] = "https://github.com/davidmetta/flow-ruby/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) { `git ls-files -z`.split("\x0") }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "grpc"
  spec.add_dependency "json"
  spec.add_development_dependency "grpc-tools"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.13.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
end
