require_relative "board"
require_relative "humanplayer"

class Game

    attr_reader :current_player
    def initialize(*players_mark)
        @board = Board.new
        #@board.print
        @players = []
        players_mark.each { |mark| @players << HumanPlayer.new(mark) }
        @current_pos = 0
        @current_player = @players[@current_pos] 
    end

    def switch_turn
        @current_pos = (@current_pos + 1) % @players.length
        @current_player = @players[@current_pos]
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            if @board.win?(@current_player.mark)
                p " Congrats player " + @current_player.mark.to_s + "! You have won!"
                return
            else
                self.switch_turn
            end

        end
        p "It's a draw!"
    end

end

game = Game.new(:X, :O)
game.play