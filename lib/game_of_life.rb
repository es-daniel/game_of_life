class GameOfLife
  def initialize
    @grid = [[]]
    @temp_grid = [[]]
  end

  def draw
    @grid.each do |row|
      puts row.join(' ')
    end
  end

end

