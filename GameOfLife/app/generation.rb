class Generation

  attr_accessor :cells

  def initialize
    self.cells = Hash.new([])
  end

  def add_cell(x, y, state)
    self.cells[x][y] = Cell.new(state)
  end

  def tick

  end

end
