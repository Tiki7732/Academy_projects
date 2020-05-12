class Board

    attr_reader :grid
    def initialize(size = 3)
        @grid = Array.new(size){Array.new(size, '_')}
    end

    def valid_position(position)
        return false if position[0] < 0 || position[0]>= @grid.length 
        return false if position[1] < 0 || position[1]>= @grid.length
        true
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if self.valid_position(position)
            @grid[position[0]][position[1]] = mark if self.empty?(position)
        else
            raise p "Not a valid position"
        end
    end

    def print
        @grid.each {|row| p row}
    end

    def win_row?(mark)
         @grid.each do |row| 
            return true if row.all?{ |ele| ele == mark}
         end
        false
    end

    def win_colomn?(mark)
        @grid.transpose.each do |col|
            return true if col.all?{ |ele| ele == mark}
        end
        false
    end

    def win_diagnol?(mark)
        diag1 = []
        diag2 = []
        @grid.each_with_index { |sub, ind| diag1 << sub[ind]}
        @grid.reverse.each_with_index {|sub, ind| diag2 << sub[ind]}
        return true if diag1.uniq.length == 1 && diag1[0] == mark
        return true if diag2.uniq.length == 1 && diag2[0] == mark
        false
    end

    def win?(mark)
        return true if win_row?(mark)
        return true if win_colomn?(mark)
        return true if win_diagnol?(mark)
        false
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any?{|ele| ele == '_'}
        end
        false
    end

    def legal_positions
        legal_pos = []
        @grid.each_with_index do |row, ind1|
            row.each_with_index do |ele, ind2|
                legal_pos << [ind1, ind2] if ele == '_'
            end
        end
        legal_pos
    end

end

# b = Board.new
# b.print
# p b.legal_positions
# b. place_mark([0, 0], :X)
# p "---"
# b.print
# p b.legal_positions