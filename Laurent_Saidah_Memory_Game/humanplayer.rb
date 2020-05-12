class HumanPlayer

    attr_reader :name
    def initialize(name, num_matches_required)
        @name = name
       @possible_moves = []
    end

    def receive_revealed_card(pos, face_val)
    end

    def receive_match(pos)
        #@possible_moves.reject!{|move| move == pos}
    end

    def prompt(possible_moves)
        @possible_moves = possible_moves
        puts "#{@name} please enter a postion"
        guess = self.get_input
      
        return guess
    end

    def get_input
       begin
           guess = gets.chomp.split(" ").map{|num| num.to_i}
           raise if guess.length != 2 || !@possible_moves.include?(guess)
           return guess
       rescue 
        puts "Sorry that was not a valid position"
        self.prompt
       end 
    end
end

# h = HumanPlayer.new("Laurent", [[0,1], [1,1], [2,1]])
#  p h.prompt