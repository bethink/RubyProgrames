class IOHelper
  def self.row_states(row)
    row.split(/\s+/).collect do |state|
      state[/[xX]/] ? true : false
    end
  end
  
  def self.print_generation(generation)
    result = ''
    generation.cells.each_pair do |x, array|
      array.each do |cell|
        result << cell.printable_state
      end
      result << "\n"
    end
    puts result
  end
  
end