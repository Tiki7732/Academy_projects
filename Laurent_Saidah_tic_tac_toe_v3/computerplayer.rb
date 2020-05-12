class ComputerPlayer

    attr_reader :mark
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(possible_pos)
       pos = possible_pos.sample
       p "Computer player " + @mark.to_s + " has chosen " + pos.to_s
       pos 
    end
end

# c = ComputerPlayer.new(:C)
# p c.get_position([[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]])