#!/usr/bin/env ruby
require 'rubygems'

Dir["#{File.dirname(__FILE__)}/app/*.rb"].each {|file| require file }

# ===================== INPUT =====================
puts 'Input:'

upper_right_ord = gets.strip

exit if upper_right_ord == '-1'

upper_right_ord = upper_right_ord.split(/\s+/)

positions_instructions = []

while ((deploy_position = gets.strip) != '-1')
  deploy_position = deploy_position.split(/\s+/)
  instructions = gets.strip.split(//)

  positions_instructions << [deploy_position, instructions]
end

# ===================== PROCESSING =====================

plateau = Plateau.new(upper_right_ord)
instructor = Instructor.new(plateau)

positions_instructions.each do |position, instructions|
  rover = instructor.deploy_rover(*position)
  instructor.instruct_rover(rover, instructions)
end

# ===================== OUTPUT =====================

puts "\nOutput:"
IOHelper.print_plateau(plateau)
