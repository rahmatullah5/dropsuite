#!/usr/bin/env ruby
require_relative './converter'
puts 'What is the folder name or its path :'
folder_destination = gets
puts 'Results :'
puts Converter.new(folder_destination).call