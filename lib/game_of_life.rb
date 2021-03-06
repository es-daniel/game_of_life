# Game structure class
class GameOfLife
  def initialize
    @grid = Array.new(5) { Array.new(5) { '▢' } }
    @temp_grid = Array.new(5) { Array.new(5) { '▢' } }
  end

  def start
    seed
    n = 1
    while n <= 2
      @grid.each_with_index do |row, i|
        row.each_with_index do |cell, j|
          update_cell(i, j, cell, count_neighbors(i, j, row))
        end
      end
      @grid = @temp_grid
      draw
      n += 1
    end
  end
  

  # This method count the total neighbors for a specific cell
  # @param axis_i == current row index
  # @param axis_j == current cell index
  # @param row ==  current row
  def count_neighbors(axis_i, axis_j, row)
    # Count top and bottom neighbors
    cell_neighbors = [top_neighbors(axis_i, axis_j), bottom_neighbors(axis_i, axis_j)]
    # Count right neighbor
    cell_neighbors << 1 if row[axis_j + 1] == '▣' && (row.length - 1) != axis_j
    # Count left neighbor
    cell_neighbors << 1 if row[axis_j - 1] == '▣' && !axis_j.zero?
    cell_neighbors.sum(&:to_i)
  end

  # This method creates initial pattern
  def seed
    @grid.each do |row|
      2.times { |_| rand_living_cell(row) }
    end
  end

  # This method add random living cells for the initial pattern
  def rand_living_cell(row)
    row[rand(0..4)] = '▣'
  end

  def draw
    @grid.each do |row|
      puts row.join(' ')
    end
  end

  private

  def neighbor_axis_j(index)
    case index
    when 0 then 0..1
    when @grid.length - 1 then (index - 1)..index
    else (index - 1)..(index + 1)
    end
  end

  # This method count top neighbors
  def top_neighbors(axis_i, axis_j)
    @grid[axis_i - 1][neighbor_axis_j(axis_j)].count { |n| n == '▣' } unless axis_i.zero?
  end

  # This method count bottom neighbors
  def bottom_neighbors(axis_i, axis_j)
    @grid[axis_i + 1][neighbor_axis_j(axis_j)].count { |n| n == '▣' } if (@grid.length - 1) != axis_i
  end

end

