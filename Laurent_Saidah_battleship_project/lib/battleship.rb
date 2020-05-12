require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size/2
    end

    def start_game
        @board.place_random_ships
        p "There are #{@board.num_ships} hidden ships on this board."
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        end
        return false
    end

    def win?
        if @board.num_ships == 0
            p "you win"
            return true
        end
        return false
    end

    def game_over?
        return true if self.win? || self.lose?
        return false
    end

    def turn
        @remaining_misses -= 1 if !@board.attack(@player.get_move)
        @board.print
        p "#{@remaining_misses} remaining misses"
    end
end
