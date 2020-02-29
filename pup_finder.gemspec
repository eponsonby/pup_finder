
lib = File.expand_path("./lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/pup_finder/version"

Gem::Specification.new do |spec|
  spec.name          = "pup_finder"
  spec.version       = PupFinder::VERSION
  spec.authors       = ["Erin Ponsonby"]
  spec.email         = ["erinponsonby@gmail.com"]

  spec.summary       = %q{A gem for browsing the American Kennel Clubs offical list of dogs.}
  spec.homepage      = "https://github.com/eponsonby/pup_finder"
  spec.license       = "MIT"


  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  
  spec.bindir = "bin"
  spec.executables = ["pup_finder"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"


end
