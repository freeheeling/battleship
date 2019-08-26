require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/player'
require './lib/game'
require './lib/computer'

cruiser = Ship.new("Cruiser", 3)
submarine = Ship.new("Submarine", 2)
player_board = Board.new
computer_board = Board.new

computer = Computer.new(computer_board, player_board)
player = Player.new(computer_board, player_board)
game = Game.new(computer_board, player_board)

game.main_menu

# Computer setup
computer.add_ship(cruiser)
computer.add_ship(submarine)
computer.place_ships
computer.prompt_player

# Player setup
player.add_ship(cruiser)
player.add_ship(submarine)

player.present_board


until computer_board.render.count("X") == 5 || player_board.render.count("X") == 5
  game.display_boards

  player.fire_upon_coord
  computer.fire_upon_coord
end

game.display_boards
