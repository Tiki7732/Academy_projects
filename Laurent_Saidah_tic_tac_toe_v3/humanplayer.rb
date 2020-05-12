class HumanPlayer
    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end
    
    def get_position(possible_pos)
        begin
            p "Player " + @mark.to_s + " Please enter two numbers representing a position in the format `row col` "
            pos = gets.chomp().split(" ").map {|num| num.to_i}
            if pos.length > 2 || !possible_pos.include?(pos)
                raise "Sorry, that was an invalid position" 
            end
            return pos
            rescue
                p "Sorry, " + pos.to_s + " is not a valid position" 
                self.get_position(possible_pos)
        end
        
        # p pos
    end
end

  l = HumanPlayer.new(:L)
 p l.get_position([[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]])