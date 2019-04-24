# frozen_string_literal: true

require 'bundler'
require_relative 'app.rb'

Bundler.require
Dir.glob('models/*.rb').map { |model| require_relative model }
use Rack::MethodOverride

run App
