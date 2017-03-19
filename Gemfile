source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby ">= 2.3"

gem "rails", "~> 5.0.2"
gem "pg", "~> 0.20.0"
gem "sequel-rails", "~> 0.9.14"
gem "puma", "~> 3.0"

gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"

gem "listen", "~> 3.0.5"
gem "sneakers"

group :development, :test do
  gem "byebug", platform: :mri
  gem "rspec-rails", "~> 3.5"
  gem "simplecov", require: false
end

group :development do
  gem "guard"
  gem "guard-rspec",                            require: false
  gem "rack-livereload"
  gem "guard-livereload", "~> 2.5", ">= 2.5.2", require: false
  gem "guard-migrate",                          require: false
  gem "guard-bundler-audit",                    require: false
  gem "guard-puma",                             require: false
  gem "guard-rubocop",                          require: false
  gem "guard-bundler",                          require: false

  gem "better_errors"
  gem "binding_of_caller"
  gem "web-console", ">= 3.3.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
