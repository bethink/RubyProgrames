#!/usr/bin/env ruby
require 'rubygems'
require 'pry'

Dir["#{File.dirname(__FILE__)}/app/*.rb", "#{File.dirname(__FILE__)}/app/helper/*.rb"].each {|file| require file }

puts 'Enter items one by one'

row = gets.strip
x = 0

game = Game.new
generation = game.generation

while (row != "-1")
  row_states = IOHelper.row_states(row)

  row_states.each_with_index do |state, y|
    generation.add_cell(x, y, state)
  end

  row = gets.strip
  x += 1 unless row.empty?
end

puts '===='
game.print_generation
puts '===='

game.next_generation
game.print_generation
#if item.nil?
#  raise InvalidInputException, "Invalid input item \"#{input_str}\""
#end


