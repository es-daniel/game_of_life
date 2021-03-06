# This class contain utils methods
class Utils

  # This method creates initial pattern
  # @param grid is the current grid
  def seed(grid)
    grid.each do |row|
      2.times { |_| rand_living_cell(row) }
    end
  end

  # This method add random living cells for the initial pattern
  # @param row is the current row of the pattern
  def rand_living_cell(row)
    row[rand(5..15)] = '▣'
  end

  # This method draw the current grid in the console
  # @param grid is the current grid
  def draw(grid)
    puts '----- A NEW COLONY BEGIN -----'
    grid.each do |row|
      puts row.join(' ')
    end
  end

  # This method creates a new grid
  def build_new_grid
    Array.new(20) { Array.new(25) { '▢' } }
  end

end