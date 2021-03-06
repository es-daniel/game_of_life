require_relative 'game_of_life'

# Game introduction
puts '----- Welcome to Game of Life -----'
puts
puts '- - - - -GAME NOTES - - - - - - -'
puts '▣ --> This represent a living cell'
puts '▢ --> This represent a dead cell'

puts 'IMPORTANT: In order to see the behavior of the game, a random number of generations will be shown,
the number of generations can be between 5 and 20 including them.'

puts



# Create a new instance of the game
@game = GameOfLife.new

# Set a number of generations
@game.init_generations

# Start the game
@game.start

