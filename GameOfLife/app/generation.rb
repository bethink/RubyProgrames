class Generation

  attr_accessor :cells

  def initialize
    self.cells = Hash.new([])
  end

  def add_cell(x, y, state)
    self.cells[x][y] = Cell.new(x, y, state)
  end

  def neighbours(cell)
    x = cell.x
    y = cell.y

    live_neighbour_count = 0

    m = cells[x-1][y]
    n = cells[x+1][y]

    live_neighbour_count += 1 if m.live?
    live_neighbour_count += 1 if n.live?
    live_neighbour_count += 1 if cells[x][y-1].live?
    live_neighbour_count += 1 if cells[x][y+1].live?
    live_neighbour_count += 1 if cells[m.x][y-1].live?
    live_neighbour_count += 1 if cells[m.y][y+1].live?
    live_neighbour_count += 1 if cells[n.x][y-1].live?
    live_neighbour_count += 1 if cells[n.y][y+1].live?
  end

  def tick
    new_generation = Generation.new

    self.cells.each_pair do |x, array|
      array.each_with_index do |cell, y|
        neighbours(cell)
        new_generation[x][y] = new_cell
      end
    end

  end

end
