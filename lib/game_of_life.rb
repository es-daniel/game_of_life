# Game structure class
class GameOfLife
  require_relative 'utils'

  attr_accessor :utils, :generations
  attr_reader :grid

  def initialize
    @utils = Utils.new
    @grid = utils.build_new_grid
    # Create an initial pattern
    utils.seed(@grid)
    utils.draw(@grid)
  end

  # This method start the game
  def start
    n = 1
    while n <= @generations
      reset_temp_grid
      @grid.each_with_index do |row, i|
        row.each_with_index { |cell, j| update_cell(i, j, cell, count_neighbors(i, j, row)) }
      end
      @grid = @temp_grid
      utils.draw(@grid)
      n += 1
    end
  end

  # This method will determine the number of generations to be displayed
  def init_generations
    @generations = rand(5..20)
  end

  # This method update de current cells
  # @param axis_i == current row index
  # @param axis_j == current cell index
  # @param cell == current cell
  # @cell_neighbors ==  number of cell's neighbors
  def update_cell(axis_i, axis_j, cell, cell_neighbors)
    if (cell.eql?('▣') && [2, 3].include?(cell_neighbors)) || (cell.eql?('▢') && cell_neighbors == 3)
      @temp_grid[axis_i][axis_j] = '▣'
    else
      @temp_grid[axis_i][axis_j] = '▢'
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

  private

  # This method determine the axis_j for the neighbors
  # @param index == axis_j of the current cell
  def neighbor_axis_j(index)
    case index
    when 0 then 0..1
    when @grid.length - 1 then (index - 1)..index
    else (index - 1)..(index + 1)
    end
  end

  # This method count top neighbors
  # @param axis_i == current row index
  # @param axis_j == current cell index
  def top_neighbors(axis_i, axis_j)
    @grid[axis_i - 1][neighbor_axis_j(axis_j)].count { |n| n == '▣' } unless axis_i.zero?
  end

  # This method count bottom neighbors
  # @param axis_i == current row index
  # @param axis_j == current cell index
  def bottom_neighbors(axis_i, axis_j)
    @grid[axis_i + 1][neighbor_axis_j(axis_j)].count { |n| n == '▣' } if (@grid.length - 1) != axis_i
  end

  # This method reset the temp @grid
  def reset_temp_grid
    @temp_grid = utils.build_new_grid
  end

end

