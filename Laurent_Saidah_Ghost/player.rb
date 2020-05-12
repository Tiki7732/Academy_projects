class Player
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def guess(fragment)
        puts "The current fragment is: #{fragment}"
        puts @name + " please enter a guess: "
        # @player_guess = 
        return gets.chomp.downcase
        # self.guess if !alert_invalid_guess(@player_guess)
        # @player_guess
    end

    def alert_invalid_guess(char)
        # valid = true
        # alpha = ('a'..'z').to_a
        # valid = false if string.length > 1 
        # valid = false if !alpha.include?(string)
        # p @name + " that guess was not a valid guess" if !valid
        # valid
        p "#{char} is not a valid move!"
        p "Your guess must be a letter of the alphabet."
    end
end

#  p = Player.new("Jerry")
#  p.guess 
#  p.alert_invalid_guess("cc")