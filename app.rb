require "bundler"
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require "controller"
require "router"
require "json"
Router.new.perform
