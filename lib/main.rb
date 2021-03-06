require_relative 'game_of_life'

# Game introduction
puts '----- Welcome to Game of Life -----'
puts '▣ --> This represent a living cell'
puts '▢ --> This represent a dead cell'

# Create a new instance of the game
@game = GameOfLife.new

# Create an initial pattern
@game.seed

# Prints the initial pattern
@game.draw

# Start the game
@game.start

