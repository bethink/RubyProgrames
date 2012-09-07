class Game

  attr_accessor :generation, :prev_generation

  def initialize
    self.generation = Generation.new
  end

  def next_generation
    self.prev_generation = self.generation.tick
  end

end