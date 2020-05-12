require_relative 'player'
require "set"
require_relative 'aiplayer'

class GhostGame
    attr_reader :fragment, :current_player, :previous_player, :losses
    ALPHA = Set.new("a".."z")

    def initialize(*players)
        @players = players
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @current_player = @players.first
        @losses = Hash.new{0}
        @players.each { |player| @losses[player] = 0 }
        @game_over = false
    end

    def next_player!
       @players.rotate!
       @current_player = @players.first
       @previous_player = @players.last
    end

    def take_turn()
        guess = @current_player.guess(fragment)
        if valid_guess?(guess)
            @fragment += guess
            # self.next_player!
        else
            p "not valid"
            @current_player.alert_invalid_guess(guess)
            self.take_turn

        end
    end

    def valid_guess?(char)
        return false if !ALPHA.include?(char)
        @dictionary.any?{ |word| word.start_with?(@fragment + char)}
    end

    def won_round?
        return true if @dictionary.include?(@fragment)
    end

    def display_standings
        ghost = " GHOST"
        @losses.each do |player, losses|
            p "#{player.name}:" + ghost[0..losses]
        end
    end

    def play_round
        @fragment = ""
        while !won_round?
            # p "The fragment is: #{@fragment}"
            self.take_turn
            self.next_player!
        end    
        @losses[@previous_player] += 1
        p " #{@current_player.name} won the round!"
        p "The word was #{@fragment}"
        if @losses[@previous_player] == 5
            p "#{@previous_player.name} has been eliminated"
            @players.delete(@previous_player)
        end
        @game_over = true if @players.length == 1
    end
    
    def run
        while !@game_over
            system("clear")
            self.display_standings
            self.play_round
        end
        p "#{@players.first.name} is the winner!"
    end
end

if $PROGRAM_NAME == __FILE__
    Blah = Player.new("Baby_dunk")
    Argh = Player.new("Laurent")
    Gaaw = Player.new("Bowie")
    Rod = Aiplayer.new("Rod", 4)
    g = GhostGame.new(Blah, Argh, Gaaw, Rod)
    
    g.run
end
