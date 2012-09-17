#!/usr/bin/env ruby
require 'rubygems'
require 'pry'

Dir["#{File.dirname(__FILE__)}/app/*.rb", "#{File.dirname(__FILE__)}/app/helper/*.rb"].each {|file| require file }

puts 'Enter items one by one'

row = gets.strip
x = 1

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

generation.add_outer_layer

game.next_generation
puts "Result:\n"
game.print_generation