require 'rubygems'

# Fix JS runtime error on Ubuntu 11.10
# http://npenkov.com/2011/11/08/get-ruby-on-rails-working-on-ubuntu-11-10/
#require 'execjs'
#require 'v8'
# The fix before was fine to run rails server, yet running rspec still
# was impossible (JS runtime error).
# Installing Node.js solved that:
# https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
