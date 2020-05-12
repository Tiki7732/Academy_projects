require_relative 'card'
class Board

    attr_reader :grid, :symbols
    def initialize(num_cards = 16, matches = 2)
        @symbols = []
        cards = select_cards(num_cards/matches)
        matches.times do 
            @symbols += cards
        end
        @grid = Array.new(Math.sqrt(symbols.length)){Array.new(Math.sqrt(symbols.length))}
    end
    
    def populate
        num = 0
        @symbols.shuffle!
        @grid.each do |row|
            row.each_index do |ind|
                face_val = @symbols[num]
                row[ind] = Card.new(face_val)
                num += 1
            end
           
        end
    end

    def select_cards(num_cards)
        card_deck = ('A'..'Z').to_a
         selected = card_deck.sample(num_cards)
         return selected
    end

    def possible_moves
        moves = []
        @grid.each_with_index do |row, ind1|
            row.each_index do |ind2|
                moves << [ind1, ind2] if !@grid[ind1][ind2].face_up
            end
        end
        return moves
    end

    def render
        print " "
        @grid.each_index {|ind| print " #{ind.to_s}"}
        puts "\n"
        @grid.each_with_index do |row, ind|
           print ind.to_s + " "
          row.each do |card|
            print card
            print " "
          end
          puts "\n"
        end
    end

   
    def reveal_all
        @grid.each do |row|
            row.each {|card| card.reveal }
        end
    end

    def won?
        @grid.each do |row|
            return false if row.any?{|card| !card.face_up}
        end
        true
    end

    def reveal(pos)
        @grid[pos[0]][pos[1]].reveal unless @grid[pos[0]][pos[1]].face_up
        #self.render
    end

    def get_card(pos)
        return @grid[pos[0]][pos[1]]
    end


end

#   b =Board.new(36)
#   b.populate
#   b.render
# b.reveal([0,1])
# b.reveal([0,1])

# p b.won?
#  b.reveal_all
#  b.render
# p b.won?
 