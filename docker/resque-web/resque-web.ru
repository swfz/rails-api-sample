#!/usr/bin/env ruby
# encoding: utf-8

require 'resque/server'
redis_host = ENV["REDIS_HOST"] || 'localhost'
Resque.redis = Redis.new(:host => redis_host, :port => 6379)
run Rack::URLMap.new '/' => Resque::Server.new
