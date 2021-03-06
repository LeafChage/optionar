
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "optionar/version"

Gem::Specification.new do |spec|
  spec.name          = "optionar"
  spec.version       = Optionar::VERSION
  spec.authors       = ["LeafChage"]
  spec.email         = ["d0o0b_lx3xl@yahoo.co.jp"]

  spec.summary       = "Do you like nil?"
  spec.description   = "You can use 'optionar' like swift"
  spec.homepage      = "https://github.com/LeafChage/optionar"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
