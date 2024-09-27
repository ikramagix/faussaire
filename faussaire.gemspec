# frozen_string_literal: true

require_relative "lib/faussaire/version"

Gem::Specification.new do |spec|
  spec.name = "faussaire"
  spec.version = Faussaire::VERSION
  spec.authors = ["ikramagix"]
  spec.email = ["hello@ikramagix.com"]

  spec.summary = "Generate a wide range of fake data in French and Greek"
  spec.description = "Faussaire is a Ruby gem that allows you to effortlessly generate a diverse set of fake data in multiple languages, including French and Greek. Whether you're developing and testing applications or need placeholder content for design mockups, Faussaire provides a simple and flexible way to create realistic-looking data on demand."
  spec.homepage = "https://github.com/ikramagix/faussaire"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ikramagix/faussaire"
  spec.metadata["changelog_uri"] = "https://github.com/ikramagix/faussaire/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
