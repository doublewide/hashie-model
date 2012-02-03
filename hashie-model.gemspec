# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "hashie-model"
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ZenCash.com"]
  s.date = "2012-02-03"
  s.description = "Hashie2 + ActiveModel 3, offering declared properties, validations, JSON serialization/deserialization"
  s.email = "istvan@zencash.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "LICENSE.txt",
    "README.md",
    "hashie-model.gemspec",
    "lib/hashie-model.rb",
    "lib/hashie_model/array_of.rb",
    "lib/hashie_model/associated_validator.rb",
    "lib/hashie_model/base.rb",
    "lib/hashie_model/money.rb",
    "lib/hashie_model/spec/matchers.rb",
    "lib/hashie_model/version.rb",
    "vendor/hashie2/lib/hashie2.rb",
    "vendor/hashie2/lib/hashie2/clash.rb",
    "vendor/hashie2/lib/hashie2/dash.rb",
    "vendor/hashie2/lib/hashie2/extensions/coercion.rb",
    "vendor/hashie2/lib/hashie2/extensions/deep_merge.rb",
    "vendor/hashie2/lib/hashie2/extensions/indifferent_access.rb",
    "vendor/hashie2/lib/hashie2/extensions/key_conversion.rb",
    "vendor/hashie2/lib/hashie2/extensions/merge_initializer.rb",
    "vendor/hashie2/lib/hashie2/extensions/method_access.rb",
    "vendor/hashie2/lib/hashie2/extensions/structure.rb",
    "vendor/hashie2/lib/hashie2/hash.rb",
    "vendor/hashie2/lib/hashie2/hash_extensions.rb",
    "vendor/hashie2/lib/hashie2/mash.rb",
    "vendor/hashie2/lib/hashie2/trash.rb",
    "vendor/hashie2/lib/hashie2/version.rb"
  ]
  s.homepage = "http://github.com/doublewide/hashie-model"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Hashie2 + ActiveModel 3.x"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yajl-ruby>, [">= 0.8.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1.1"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.1.1"])
      s.add_runtime_dependency(%q<money>, [">= 3.7.1"])
      s.add_development_dependency(%q<linecache19>, ["~> 0.5.13"])
      s.add_development_dependency(%q<ruby-debug-base19>, ["~> 0.11.26"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<shoulda-matchers>, ["~> 1.0.0.beta3"])
      s.add_development_dependency(%q<yard>, [">= 0.7.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_development_dependency(%q<growl>, [">= 0"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-yard>, [">= 0"])
      s.add_development_dependency(%q<guard-bundler>, [">= 0"])
    else
      s.add_dependency(%q<yajl-ruby>, [">= 0.8.0"])
      s.add_dependency(%q<activesupport>, [">= 3.1.1"])
      s.add_dependency(%q<activemodel>, [">= 3.1.1"])
      s.add_dependency(%q<money>, [">= 3.7.1"])
      s.add_dependency(%q<linecache19>, ["~> 0.5.13"])
      s.add_dependency(%q<ruby-debug-base19>, ["~> 0.11.26"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<shoulda-matchers>, ["~> 1.0.0.beta3"])
      s.add_dependency(%q<yard>, [">= 0.7.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_dependency(%q<growl>, [">= 0"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<guard-yard>, [">= 0"])
      s.add_dependency(%q<guard-bundler>, [">= 0"])
    end
  else
    s.add_dependency(%q<yajl-ruby>, [">= 0.8.0"])
    s.add_dependency(%q<activesupport>, [">= 3.1.1"])
    s.add_dependency(%q<activemodel>, [">= 3.1.1"])
    s.add_dependency(%q<money>, [">= 3.7.1"])
    s.add_dependency(%q<linecache19>, ["~> 0.5.13"])
    s.add_dependency(%q<ruby-debug-base19>, ["~> 0.11.26"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<shoulda-matchers>, ["~> 1.0.0.beta3"])
    s.add_dependency(%q<yard>, [">= 0.7.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, [">= 0"])
    s.add_dependency(%q<growl>, [">= 0"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<guard-yard>, [">= 0"])
    s.add_dependency(%q<guard-bundler>, [">= 0"])
  end
end

