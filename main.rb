class Player
  @@player_list = []
  @@player_count = 0
  def initialize(name, sign)
    @name = name
    @sign = sign
    @@player_list[@@player_count] = @name
    @@player_count += 1

  end

  def print_name
    @name
  
  end
  def print_sign
    @sign
  end
  def print_player_list
    @@player_list
  end

end

class Game
  def initialize
    @winner = false
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
    puts " Game Board. This grid shows the coordinates"
    puts "\r"
    puts "#{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}                    #{@coord_board[0][0]}  |  #{@coord_board[0][1]}  |  #{@coord_board[0][2]}"
    puts "#{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}                    #{@coord_board[1][0]}  |  #{@coord_board[1][1]}  |  #{@coord_board[1][2]}"
    puts "#{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}                    #{@coord_board[2][0]}  |  #{@coord_board[2][1]}  |  #{@coord_board[2][2]}"
    puts "\r"
  end
  def check_win(player1, player2)
    player_list= []
    player_list << player1
    player_list << player2
    player_list.each  do |player| 
      if (player.print_sign == @board[0][0] && player.print_sign == @board[0][1] && player.print_sign == @board[0][2])       #row1
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      elsif (player.print_sign == @board[1][0] && player.print_sign == @board[1][1] && player.print_sign == @board[1][2])   #row2
        puts  "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      elsif (player.print_sign == @board[2][0] && player.print_sign == @board[2][1] && player.print_sign == @board[2][2])   #row3
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true

      elsif (player.print_sign == @board[0][0] && player.print_sign == @board[1][0] && player.print_sign == @board[2][0])   #column1
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      elsif (player.print_sign == @board[0][1] && player.print_sign == @board[1][1] && player.print_sign == @board[2][1])   #column2
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      elsif (player.print_sign == @board[0][2] && player.print_sign == @board[1][2] && player.print_sign == @board[2][2])   #column3
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      
      elsif (player.print_sign == @board[0,0] && player.print_sign == @board[1,1] && player.print_sign == @board[2,2])   #cross1
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      elsif (player.print_sign == @board[2,0] && player.print_sign == @board[1,1] && player.print_sign == @board[0,2])   #cross2
        puts "#{player.print_name} WINS!!! GOOD JOB!!!!!!"
        @winner = true
      elsif @coord_board.all? { |value| value == "X" || value == "O" }
        puts "Noone won this round. Try again."
        @winner = true
      else
        @winner == false
      end
    
    end
    if @winner == true
      finish_game
    end
  end
  def finish_game
    puts "This round has ended. Try again"
    start_game

  end

  def game_turn(player1, player2)
    valid1 = false
    until valid1 == true 
      puts "#{player1.print_name}, make your move \n Please enter the coordinates seperated by a space"
      player_selection = gets.chomp.split(' ')
      player_selection[0] = player_selection[0].to_i
      player_selection[1] = player_selection[1].to_i

      if (player_selection[0] == 0 || player_selection[0] == 1 || player_selection[0] == 2) && (player_selection[1] == 0 || player_selection[1] == 1 || player_selection[1] == 2) && @board[player_selection[0]][player_selection[1]] == '_'
        valid1 = true
        p "wise choice"
        @board[player_selection[0]][player_selection[1]] = player1.print_sign
        display_board
      else
       p"invalid choice, try again"
      end
    end
    check_win(player1, player2)
    #Second player turn
    valid2 = false
    until valid2 == true 
      puts "#{player2.print_name}, make your move \n Please enter the coordinates seperated by a space"
      player_selection = gets.chomp.split(' ')
      player_selection[0] = player_selection[0].to_i
      player_selection[1] = player_selection[1].to_i

      if (player_selection[0] == 0 || player_selection[0] == 1 || player_selection[0] == 2) && (player_selection[1] == 0 || player_selection[1] == 1 || player_selection[1] == 2) && @board[player_selection[0]][player_selection[1]] == '_'
        valid2 = true
        p "wise choice"
        @board[player_selection[0]][player_selection[1]] = player2.print_sign
        display_board
      else
       p"invalid choice/position already taken, try again"
      end
    end
    check_win(player1, player2)
    if @winner == false
      game_turn(player1, player2)
    elsif @winner == true
      finish_game
    end
    



  end
end

def get_player_name(player1, player2 = nil)
  if player1 != nil
    puts 'Hello player 2, please enter your name: '
  else
    puts 'Hello player 1, please enter your name: '
  end
  gets.chomp
end

def start_game
  player1 = nil
  player2 = nil
  player1 = Player.new(get_player_name(player1), 'X')
  player2 = Player.new(get_player_name(player1, player2), 'O')
  game = Game.new
  game.display_board
  game.game_turn(player1, player2)
  puts "Player 1: #{player1.print_name} and player 2: #{player2.print_name}"
end

start_game