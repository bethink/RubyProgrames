class Cell
  attr_accessor :state, :prev_state, :x, :y

  def initialize(x, y, state)
    self.state = state
    self.prev_state = state
  end

  def alive?
    self.state
  end

  def dead?
    self.state
  end

  def state_changed?
    self.state != self.prev_state
  end

  def live_neighbour_count

  end

  def live_neighbours

  end

end