require 'rubygems'
require 'bundler'
Bundler.setup

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'sinatra'
require 'redis'
require 'mustache/sinatra'
require 'sprockets'
require 'coffee-script'
require 'sass'
require 'app'
require "autoprefixer-rails"

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'frontend/scripts'
  environment.append_path 'frontend/styles'
  AutoprefixerRails.install(environment)
  run environment
end

map '/' do
  run RedisViewer::App.new
end
