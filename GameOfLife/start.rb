#!/usr/bin/env ruby
Dir["#{File.dirname(__FILE__)}/app/*.rb"].each {|file| require file }

puts 'Enter items one by one'

items = []
row = gets.strip
i = 0

game = Game.new
generation = game.generation

while (row != "-1")
  row_states = IOHelper.row_states(row)

  row_states.each_with_index do |state, j|
    generation.add_cell(i, j, state)
  end

  i += 1
end


#if item.nil?
#  raise InvalidInputException, "Invalid input item \"#{input_str}\""
#end


