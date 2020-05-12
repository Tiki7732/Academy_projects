require 'set'
class Aiplayer

    attr_reader :name
    ALPHA = Set.new("a".."z")
    def initialize(name, num_players)
        @name = name
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @num_players = num_players
    end
    
    def guess(fragment)
        puts "The current fragment is: #{fragment}"
        guess = winning_move(fragment)
        guess = losing_move(fragment) if guess == nil 
        puts "#{name}'s guess is: #{guess}'"
        return guess
    end

    def losing_move(fragment)
        possible_moves = []
        ALPHA.each do |char|
            possible_moves << char if @dictionary.any?{|word| word == fragment + char}
        end
        return possible_moves.sample
    end

    def winning_move(fragment)
        possible_words = []
        possible_words = @dictionary.select { |word| word.start_with?(fragment) && word.length <= (fragment.length + @num_players) }
        word = possible_words.select{|word| word.length > fragment.length + 1}.sample
        return nil if word == nil
        char = word[fragment.length]
        return char if @dictionary.none?{|word| word == fragment + char}
    end
end

#  a = Aiplayer.new("bob", 3)
# fragment = "sas"
#  p a.losing_move(fragment)
#  fragment = "bar"
#   p a.winning_move(fragment)
#  p a.guess(fragment)