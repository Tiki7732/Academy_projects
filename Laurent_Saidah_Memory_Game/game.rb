require_relative 'board'

require_relative 'humanplayer'
require_relative 'computerplayer'
class Game

    def self.select_difficulty()
        print "How hard do you want this to be? (1 - 5): "
        size = gets.chomp.to_i * 2
        return size * size
    end

    def self.select_num_match()
        print "How many matches are in the game? (2, 3, or 4): "
        matches = gets.chomp.to_i
        return matches
    end

    attr_reader :board, :matches
    attr_accessor :guessed_pos, :previous_guess
    def initialize(size, matches)
        @board = Board.new(size, matches)
        @matches = matches
        @board.populate
        @players = []
        self.make_player_list
        @previous_guess = []
        @guessed_pos = []
        @current_player = @players.first
        @turn_count = 0
        @max_turns = size * 2
        @turns_left = @max_turns
    end

    def make_first_guess(pos)
        @board.reveal(pos)
        @players.each {|player| player.receive_revealed_card(pos, @board.get_card(pos).face_val)}
        @previous_guess << @guessed_pos 
    end

    def make_next_guess(pos)
        @board.reveal(pos)
        @players.each {|player| player.receive_revealed_card(pos, @board.get_card(pos).face_val)}
        if @previous_guess.length % (@matches- 1) != 0
            @previous_guess << @guessed_pos 
            return
        end
        if @previous_guess.all?{|pos| @board.get_card(pos) == @board.get_card(@guessed_pos)} 
            @previous_guess.each do |pos|
                @players.each {|player| player.receive_match(pos)}
            end
            @previous_guess = []
        else
            system("clear")
            puts "#{@turns_left} turns left"
            @board.render
            sleep(2)
            @previous_guess.each {|pos| @board.get_card(pos).hide}
            @board.get_card(@guessed_pos).hide
            @previous_guess = []
        end
    end


    def make_player_list
        baby = HumanPlayer.new("Baby Dunk", @matches)
        laurent = HumanPlayer.new("Laurent", @matches)
        cam = ComputerPlayer.new("Cam", @matches)
        @players.push(baby, laurent, cam)
    end    

    def next_player
        @current_player = @players.rotate!.first
    end

    def play
        
        while !@board.won? 
            system("clear")
            puts "#{@turns_left} turns left"
            @board.render
            if @turn_count % @matches == 0
                @guessed_pos = @current_player.prompt(@board.possible_moves)
                sleep(1)
                make_first_guess(@guessed_pos)
            else
                @guessed_pos = @current_player.prompt(@board.possible_moves)
                sleep(1)
                make_next_guess(@guessed_pos)
            end
            @turn_count += 1
            @turns_left -= 1 if @turn_count % @matches == 0
            self.next_player if @turn_count % @matches == 0
            if @turns_left == 0
                puts "Game over"
                return
            end
            
        end
        system("clear")
        @board.render
        puts "You Won!"
    end
end

if __FILE__ == $PROGRAM_NAME
    size = Game.select_difficulty
    matches = Game.select_num_match
    g = Game.new(size, matches)
    g.play
end

