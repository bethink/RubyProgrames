class Cell
  attr_accessor :state, :prev_state, :x, :y, :live_neighbour_count

  def initialize(x, y, state)
    @x = x
    @y = y
    @state = state
    @prev_state = state
    @live_neighbour_count = nil
  end

  def live?
    self.state
  end

  def dead?
    self.state
  end

  def state_changed?
    self.state != self.prev_state
  end

  def printable_state
    self.live? ? 'X' : '-'
  end

  def kill
    self.state = false
  end  

  def get_life
    self.state = true
  end  

  def lonely?
    self.live_neighbour_count < 2
  end  
    
  def over_crowdy?
    self.live_neighbour_count > 3
  end  

  def can_get_life?
    self.live_neighbour_count = 3
  end

  def next_generation_cell
    
    new_cell = Cell.new(self.x, self.y, self.state)
    
    if self.live?
      if self.lonely? or self.over_crowdy?
        new_cell.kill
      end
    else
      if self.can_get_life?
        new_cell.get_life
      end
    end
    
    return new_cell
  end

end