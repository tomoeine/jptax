
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jptax/version"

Gem::Specification.new do |spec|
  spec.name          = "jptax"
  spec.version       = Jptax::VERSION
  spec.authors       = ["tomoeine"]
  spec.email         = ["tomoe.teshima@gmail.com"]

  spec.summary       = %q{Easy calculating Japanese consumption tax.}
  spec.description   = %q{Easy calculating Japanese consumption tax.}
  spec.homepage      = "https://github.com/tomoeine/jptax"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
