class IOHelper
  def self.parse_row(row)
    row.split(/\s+/).each do |state|
      state[/[xX]/] ? Cell : 1
    end
  end
end