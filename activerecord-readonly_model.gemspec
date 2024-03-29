# -*- encoding: utf-8 -*-
require File.expand_path('../lib/active_record-readonly_model/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Christian Dinger"]
  gem.email         = ["cdinger@gmail.com"]
  gem.description   = %q{Makes an ActiveRecord model read-only}
  gem.summary       = %q{Makes an ActiveRecord model read-only}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "activerecord-readonly_model"
  gem.require_paths = ["lib"]
  gem.version       = ActiveRecord::ReadonlyModel::VERSION

  gem.add_dependency('activerecord', '>= 3.0.0')
end
