#!/usr/bin/env ruby
require_relative './converter'
puts 'What is the folder name or its path :'
puts Converter.new(gets).call