require './test/test_helper'

class GenerationTest < Test::Unit::TestCase

#  def add_dead_cell_row_at(x)
#    @cells[x] = []
#    ( self.max_row_size + 2 ).times do |i|
#      @cells[x] << Cell.new(x, i, false)
#    end
#  end

  def test_add_dead_cell_row_at
    generation = Generation.new
    assert true
  end

end