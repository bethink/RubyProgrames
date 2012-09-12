    # Any live cell with fewer than two live neighbours dies, as if by loneliness.
    # Any live cell with more than three live neighbours dies, as if by overcrowding.
    # Any live cell with two or three live neighbours lives, unchanged, to the next generation.
    # Any dead cell with exactly three live neighbours comes to life.

class Game

  attr_accessor :generation, :prev_generation

  def initialize
    @generation = Generation.new
  end

  def next_generation
    self.prev_generation = self.generation
    self.generation = self.generation.tick
  end
  
  def print_generation
    IOHelper.print_generation(self.generation)
  end
 
end