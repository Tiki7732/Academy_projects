
class ComputerPlayer

    attr_reader :name
    def initialize(name, num_matches_required)
        @matches = num_matches_required
        @name = name
        @known_cards = Hash.new {|key, val| key[val] = Array.new}
        @matched_cards = []
        @possible_moves = []
        @guesses = []
        @turn_count = 0
    end

    def receive_revealed_card(pos, face_val)
        @known_cards[face_val] << pos
        @known_cards[face_val].uniq!
        # p @known_cards[face_val]
        # p face_val
        # sleep (3)
        
    end

    def receive_match(pos1)
        @matched_cards.push(pos1)
        #@possible_moves.delete(pos1)
        # p "Got a match!"
        # p @possible_moves
        # sleep(2)
    end

    def prompt(possible_moves)
        @possible_moves = possible_moves
        puts "#{@name}'s turn: "
        #sleep(1)
        return self.get_guess
    end

    def get_guess
        if @turn_count % @matches == 0
            @guesses = []
            @known_cards.each_value do |pos|
                if pos.length == @matches  &&
                    @possible_moves.include?(pos.first) 
                    #!@matched_cards.include?(pos)
                    @guesses = pos
                end
            end
            # if @guesses.length > 0
            #     p "we know something"
            #     guess = @guesses.first 
            # else
            #     p "we dunno"
            #     guess = @possible_moves.sample
            # end
            guess = @guesses.first || @possible_moves.sample
        else
            guess = @guesses[@turn_count % @matches] || @possible_moves.sample
        end
        @turn_count += 1
        return guess
            
    end
end

# c = ComputerPlayer.new("Cam", [[0,0], [0,1], [1,1], [1,0], [2,0], [2,1]])
# p c.possible_moves
#  p c.prompt


# p c.possible_moves
# p c.prompt
#   c.receive_revealed_card([0,0], 'B')
#   c.receive_revealed_card([1,0], 'B')
#   c.receive_revealed_card([1,1], 'C')
#  p c.prompt
#  p c.prompt
# c.receive_match([0,0], [1,0])
# p c.possible_moves
#  p c.prompt