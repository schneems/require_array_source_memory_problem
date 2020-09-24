require 'get_process_mem'

before = GetProcessMem.new.mb
require_relative 'array_from_file.rb'
after = GetProcessMem.new.mb

puts "Memory difference (building an array from text file):     #{after - before} mb"

before = GetProcessMem.new.mb
require_relative 'huge_array_native.rb'
after = GetProcessMem.new.mb

puts "Memory difference (reading in a ruby array from source): #{after - before} mb"

before = GetProcessMem.new.mb
21.times {|i| require_relative "split/array_part_from_file_#{i}.rb" }
after = GetProcessMem.new.mb

puts "Memory difference (reading in a ruby array from source): #{after - before} mb"
