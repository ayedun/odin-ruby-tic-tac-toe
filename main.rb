class Player
  def initialize(name)
    @name = name
  end

  def print_name
    @name
  end
end

class Game
  def initialize
    @board = Array.new(3) { Array.new(3, '_') }
    @coord_board = Array.new(3) { Array.new(3, '_') }
    @coord_board.each_with_index do |_y, xi|
      @coord_board.each_with_index do |_x, yi|
        @coord_board[xi][yi] = "[#{xi}, #{yi}]"
        puts "element [#{xi}, #{yi}] is #{@coord_board[xi][yi]}"
      end
    end
  end

  def display_board
    puts ' Game Board.                    This grid is for coordinate-use'

    puts "\r"
    puts "#{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}                    #{@coord_board[0][0]}  |  #{@coord_board[0][1]}  |  #{@coord_board[0][2]}"
    puts "#{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}                    #{@coord_board[1][0]}  |  #{@coord_board[1][1]}  |  #{@coord_board[1][2]}"
    puts "#{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}                    #{@coord_board[1][0]}  |  #{@coord_board[1][1]}  |  #{@coord_board[1][2]}"
  end
end

def get_player_name(player1)
  if !player1.nil?
    puts 'Hello player 2, please enter your name: '
  else
    puts 'Hello player 1, please enter your name: '
  end
  gets.chomp
end

player1 = nil
player2 = nil
player1 = Player.new(get_player_name(player1))
player2 = Player.new(get_player_name(player1))
game = Game.new
game.display_board
puts "Player 1: #{player1.print_name} and player 2: #{player2.print_name}"
