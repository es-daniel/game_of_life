class GameOfLife
  def initialize
    @grid = [[]]
    @temp_grid = [[]]
  end

  # This method creates initial pattern
  def seed
    5.times do |_|
      row = %w[▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢ ▢]
      2.times { |_| rand_living_cell(row) }
      @grid << row
    end
  end

  def rand_living_cell(row)
    row[rand(0..8)] = '▣'
  end

  def draw
    @grid.each do |row|
      puts row.join(' ')
    end
  end

end

