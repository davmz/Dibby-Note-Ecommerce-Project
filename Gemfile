source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # Use sqlite3 as the database for Active Record
  gem "sqlite3", "~> 1.4"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

## ActiveAdmin Gem - https://rubygems.org/gems/activeadmin
gem 'activeadmin'

## Devise Gem - https://rubygems.org/gems/devise
gem 'devise', '~> 4.8', '>= 4.8.1'

## Faker Gem - https://rubygems.org/gems/faker
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

## Image Processing - https://rubygems.org/gems/image_processing
gem 'image_processing', '~> 1.12', '>= 1.12.2'

## Pagination using Kaminari - https://rubygems.org/gems/kaminari
gem 'kaminari'

## Ruby-Vips - https://rubygems.org/gems/ruby-vips
gem 'ruby-vips'

## Figaro => ENV Variables - https://rubygems.org/gems/figaro
gem 'figaro', '~> 1.2'

## Breadcrumbs - https://rubygems.org/gems/breadcrumbs_on_rails
gem 'breadcrumbs_on_rails', '~> 4.1'

## Rubocop - https://rubygems.org/gems/rubocop
gem 'rubocop', '~> 1.27'

## Rubocop-Rails - https://rubygems.org/gems/rubocop-rails
gem 'rubocop-rails', '~> 2.14', '>= 2.14.2'

## ActiveStorage - https://rubygems.org/gems/activestorage
gem 'activestorage', '~> 7.0', '>= 7.0.2.3'

## Google-Cloud Storage - https://rubygems.org/gems/google-cloud-storage
gem 'google-cloud-storage', '~> 1.36', '>= 1.36.1'

## Carrierwave - https://rubygems.org/gems/carrierwave
gem 'carrierwave', '~> 2.2', '>= 2.2.2'

## aws-sdk-s3 - https://rubygems.org/gems/aws-sdk-s3
gem 'aws-sdk-s3', '~> 1.113', require: false

## Stripe - https://rubygems.org/gems/stripe
gem 'stripe', '~> 5.53'

group :production do
  ## pg (PostgreSQL RDBMS) - https://rubygems.org/gems/pg
  gem 'pg', '~> 1.3', '>= 1.3.5'
end

## rake - https://rubygems.org/gems/rake
gem 'rake', '~> 13.0', '>= 13.0.6'

### Unused Gems throughout application
## MailJet API
# gem 'mailjet', '~> 1.6'

## Vips
# gem 'vips'
# gem 'vips-thumbnail'