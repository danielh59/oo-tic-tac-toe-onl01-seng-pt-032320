class TicTacToe

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
  ]

def initialize
    @board = Array.new(9, " ")
end

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
string.to_i - 1
  end

  def move(index_on_board, token = "X")
  @board[index_on_board] = token
  end

def position_taken?(index)
   if @board[index] == " "
     false
   else
     true
   end
 end

def valid_move?(index)
!position_taken?(index) && index.between?(0,8)
end

def turn_count
  count = 0
@board.each do |index_space|
    if index_space == 'X' || index_space =='O'
      count += 1
    else
    end
end
count
end

def current_player
  if turn_count.even? == true
    return "X"
  else
    return "O"
  end
end

def turn
  puts "Please input 1-9"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(index)
   token = current_player
    move(index, token)
  else
    turn
  end
  display_board
end

def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?
    if @board.all? {|i| i == "X" || i == "O"}
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    else false
  end
end

def over?
  if draw? || won?
    return true
end
end

def winner
    if won? == false
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    else
      return "O"
    end
end

def play
 until over?
turn
end
  # if won?
  #   puts "Congratulations #{winner}!"
  #
  # elsif draw? == true
  #   puts "Cat's Game!"
  # else
# end
end
end
