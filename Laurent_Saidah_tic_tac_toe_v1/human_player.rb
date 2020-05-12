class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end
    
    def get_position()
        p "Player " + @mark.to_s + " Please enter two numbers representing a position in the format `row col` "
        pos = gets.chomp().split(" ").map {|num| num.to_i}
        raise "Sorry, that was an invalid position" if pos.length > 2
        p pos
    end
end

player_1 = HumanPlayer.new(:X)
player_1.get_position
