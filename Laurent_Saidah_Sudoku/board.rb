require_relative 'tile'

class Board

    attr_reader :grid
    def self.make_grid
        grid = Array.new(9){Array.new(9, Tile.new(0))}
        return grid
    end

    def self.from_file(filename)
        rows = File.readlines(filename).map(&:chomp)
        tiles = rows.map do |row|
            nums = row.split("").map { |char| char.to_i}
            nums.map {|num| Tile.new(num)}
        end
    end

    def initialize(grid = Board.make_grid)
        @grid = grid
    end

    def render
        row_count = -2
        puts "            Sudoku!        "
        puts "    0 1 2   3 4 5   6 7 8"
        print "  -------------------------" 
        puts "\n"
        @grid.each_with_index do |row, ind|
           
            column_count = -2
            print "#{ind.to_s} | "
            row.each do |tile|
                print tile.to_s + " "
                print "| " if column_count % 3 == 0
                column_count += 1
            end
            puts "\n"
            print "-------------------------" if row_count % 3 == 0
            puts "\n" if row_count % 3 == 0
            row_count += 1
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col].value = value
    end

    def row(ind)
        @grid[ind].each {|tile| print tile.to_s}
    end

    def column(ind)
        transposed = @grid.transpose
        transposed[ind].each {|tile| print tile.to_s}
    end

    def rows
        @grid
    end

    def columns
        @grid.transpose
    end

    def square(ind)
        square = []
        x = (ind / 3) * 3
        y = (ind % 3) * 3
        (x...x+3).each do |ind1|
            (y...y+3).each do |ind2|
                pos = [ind1, ind2]
                square << self[pos]
            end
        end
        square
    end

    def solved_set?(tile_set)
        set = tile_set.map{|tile| tile.value}
        set.sort == (1..9).to_a
    end

    def solved?
        rows.all?{|row| self.solved_set?(row)}
        columns.all?{|column| self.solved_set?(column)}
        (0..8).all?{|int| self.solved_set?(self.square(int))}
    end
end

# b = 
# b.render 
# c = Board.new(Board.from_file("puzzles/sudoku1_almost.txt"))
# c.render
# pos = [0,0]
# b[pos] = 4
# b.render
# b.row(2)
# puts "\n"
# b.column(2)
# puts "\n"
#p b.square(2)
# pos = [0,1]
# p b.solved?
# b[pos] = 8
# pos = [0,3]
# b[pos] = 9
# b.render