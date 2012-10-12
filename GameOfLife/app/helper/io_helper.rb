class IOHelper
  def self.row_states(row)
    row = row.split(/\s+/).collect do |state|
      (state[/[xX]/] ? true : false)
    end

    [false] + row + [false]
  end

  def self.print_generation(generation)
    result = ''
    cells = generation.cells
    length = cells.length

    cells.keys.sort.each do |index|
      cells[index].each do |cell|
        result << cell.printable_state
      end
      result << "\n"
    end

    puts result
  end

end