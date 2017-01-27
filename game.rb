require_relative 'board'
require_relative 'player'

class Game

  def initialize(player)
    @player = player
    @board = Board.new
  end

  def bomb_setup
    bomb_positions = board.bomb_positions
    bomb_neighbors = board.bomb_neighbors(bomb_positions)
    update_neighbors(bomb_neighbors)
  end

  def play
    bomb_setup
    until over?
      board.render
      play_turn
    end

    if won?
      puts "Congratulations, you didn't blow up!"
    else
      puts "You have died of bomb explosion."
    end
  end

  def over?
  end

  def play_turn
    guess = nil
    until valid_move?(guess, flag)
      guess = player.get_guess
      flag = player.type_of_guess
    end
    board.update_board(guess, flag)
  end


  def won?
  end

end
