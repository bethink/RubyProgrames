class Generation

  attr_accessor :cells

  def initialize
    @cells = Hash.new()
  end

  def add_cell(x, y, state)
    @cells[x] ||= []
    @cells[x][y] = Cell.new(x, y, state)
  end
  
  def cell_at(x, y)
    if ( x < 0 || y < 0 )
      Cell.new(x, y, false)
    else 
      ( @cells[x] and @cells[x][y] ) || Cell.new(x, y, false)
    end
  end
  
  def neighbours(cell)
    x = cell.x
    y = cell.y

    live_neighbour_count = 0

    m = cell_at(x-1, y)
    n = cell_at(x+1, y)

    live_neighbour_count += 1 if m.live?
    live_neighbour_count += 1 if n.live?  
    live_neighbour_count += 1 if cell_at(x, y-1).live?
    live_neighbour_count += 1 if cell_at(x, y+1).live?
    live_neighbour_count += 1 if cell_at(m.x, y-1).live?
    live_neighbour_count += 1 if cell_at(m.x, y+1).live?
    live_neighbour_count += 1 if cell_at(n.x, y-1).live?
    live_neighbour_count += 1 if cell_at(n.x, y+1).live?
    
    cell.live_neighbour_count = live_neighbour_count 
  end

  def tick
    new_generation = Generation.new
    @cells.each_pair do |x, array|

      array.each_with_index do |cell, y|
        self.neighbours(cell)
        next_gen_cell = cell.next_generation_cell
        new_generation.add_cell(x, y, next_gen_cell.state)
      end
    end
    return new_generation
  end

  def add_dead_cell_row_at(x)
    @cells[x] = []
    self.max_row_size.times do |i|
      @cells[x] << Cell.new(x, i, false)
    end
  end

  def max_row_size
    @cells.first.last.length
  end

  #def add_dead_cell_at_terminal
  #  @cells.each_pair do |key, row|
  #    array = @cells[key]
  #    @cells[key] = [Cell.new(key, 0, false)] + row + [Cell.new(key, array.length, false)]
  #  end
  #end

  def add_outer_layer
    self.add_dead_cell_row_at(0)
    self.add_dead_cell_row_at(self.cells.length)
  end

end
