# require 'bundler/setup'
# Bundler.require(:default)
require 'open-uri'
# require_all 'lib'
require_relative '../lib/pup_finder/breed.rb'
require_relative '../lib/pup_finder/cli.rb'
require_relative '../lib/pup_finder/scraper.rb'
require_relative '../lib/pup_finder/urlgenerator.rb'
require_relative '../lib/pup_finder/version.rb'

require 'pry'
require 'require_all'
require 'nokogiri'
require 'rainbow'