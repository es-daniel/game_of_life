require_relative 'game_of_life'

# Game introduction
puts '----- Welcome to Game of Life -----'
puts '▣ --> This represent a living cell'
puts '▢ --> This represent a dead cell'

# Create a new instance of the game
@game = GameOfLife.new




# Start the game
@game.start

