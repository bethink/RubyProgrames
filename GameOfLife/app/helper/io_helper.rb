class IOHelper
  def self.row_states(row)
    row.split(/\s+/).each do |state|
      state[/[xX]/] ? true : false
    end
  end
end