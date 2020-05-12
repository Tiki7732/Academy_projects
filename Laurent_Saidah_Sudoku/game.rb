require_relative 'board'
class Game

    def initialize(filename)
        @board = Board.new(Board.from_file(filename))
        @quit = false
    end

    def get_pos
        pos = nil
        until pos && valid_pos?(pos)
            print "Please enter a postion on the board: "
            pos = gets.chomp.split(" ").map{|char| char.to_i}
        end
        pos
    end

    def get_val
        val = nil
        until val && valid_val?(val)
            print "Please enter a value: "
            val = gets.chomp.to_i
        end
        val
    end

    def valid_pos?(pos) 
        pos.is_a?(Array) &&
        pos.length == 2 &&
        pos.all?{|int| int.between?(0, @board.grid.length - 1)}
    end

    def valid_val?(value)
        value.between?(0, 9) &&
        value.is_a?(Integer)
    end

    def solved?
        @board.solved?
    end

    def quit?()
        @quit
    end

    def play_turn
        @board.render
        pos = get_pos
        val = get_val
        @board[pos] = val
    end

    def run 
        play_turn until solved? 
        @board.render
        puts "Congratulations you won!"
    end


end

if $PROGRAM_NAME == __FILE__
    game = Game.new("puzzles/sudoku1.txt")
    game.run
end
