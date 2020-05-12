require_relative "board"
require_relative "humanplayer"
require_relative "computerplayer"

class Game

    attr_reader :current_player
    def initialize(size, players_mark)
        @board = Board.new(size)
        @players = []
        #p players_mark
        players_mark.each do |mark, val|
            if !val 
                @players << HumanPlayer.new(mark)
            else
                @players << ComputerPlayer.new(mark)
            end
        end
        @current_player = @players[0]
        #p @players
        # p @current_player
        #@board.print
        # @players = []
        # players_mark.each { |mark| @players << HumanPlayer.new(mark) }
        # @current_pos = 0
        # @current_player = @players[0] 
    end

    def switch_turn
        # @current_pos = (@current_pos + 1) % @players.length
      
         @current_player = @players.rotate!.first
       
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark)
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

game = Game.new(3, X: false, Y: true)
game.play