class TicTacToe
    attr_accessor :board
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], 
    [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    def initialize()
        @board = [" ", " ", 
                  " ", " ", " ", 
                  " ", " "," ", " "] #represents the starting point of the game which has 9 empty squares.
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} " #puts is used to display the board's
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " #current values using their index in the array.
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
        input_selection = input.to_i - 1 #converting the users input string from a user friendly 
        input_selection                  # format to an array friendly format.   
    end                                
    
    def move(index, token)
        @board[index] = token
    end
   
    def position_taken?(index) #checks if an index position in the board array has been occupied
        if board[index] != " " # and returns a boolean of true if the position is occupied and false if its not
            true
        else
            false
        end
    end    
     
    def valid_move?(index)
        !position_taken?(index) && index.between?(0, 8)
    end
    
    def turn_count
        @board.count {|index| index != " "}
    end
    
    def current_player
        turn_count.even? ? "X": "O"
    end
    
    def turn
        puts "Enter the square for your move (1-9):"
       index = input_to_index(gets.chomp)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
            turn
        end
    end 

    def won?
        WIN_COMBINATIONS.each do |combinations|
            if[['X'], ['O']].include?([board[combinations[0]], board[combinations[1]], board[combinations[2]]].uniq)
                return combinations
            end
        end
        false
    end

    def full?
        if board.include?(' ')
            false
        else
            true
        end
    end

    def draw?
        self.full? && !self.won?
    end

    def over?
        self.won? || self.draw?
    end

    def winner
        if winning_combinations = won?
            return @board[winning_combinations[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
          
end
      


