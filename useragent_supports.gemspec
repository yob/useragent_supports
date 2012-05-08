Gem::Specification.new do |s|
  s.name              = "useragent_supports"
  s.version           = "0.0.1"
  s.summary           = "Check if a user agent string supports a feature"
  s.description       = "Use the data from http://caniuse.com to check if a users broser supports certain features"
  s.authors           = ["James Healy"]
  s.email             = ["james@yob.id.au"]
  s.homepage          = "http://github.com/yob/useragent_supports"
  s.has_rdoc          = true
  s.rdoc_options      << "--title" << "Useragent Supports" << "--line-numbers"
  s.files             = Dir.glob("{support,lib}/**/*") + ["README.md"]
  s.required_rubygems_version = ">=1.3.2"
  s.required_ruby_version = ">=1.8.7"

  s.add_dependency('useragent')
end
