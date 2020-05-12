class Board

    attr_reader :size,
    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(num)
        @grid = []
        num.times do
            sub_arr = Array.new(num, :N)
            @grid << sub_arr
        end
        @size = num * num
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |ele|
                count += 1 if ele == :S
            end
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos]= :H
            p "you sunk my battleship!"
            return true
        else
            self[pos]= :X
            return false
        end
    end

    def place_random_ships
        ship_count = @size / 4
        while ship_count > 0
            rand_pos = []
            rand_pos << rand(Math.sqrt(@size))
            rand_pos << rand(Math.sqrt(@size))
            if self[rand_pos] != :S
                self[rand_pos] = :S 
                ship_count -=1
            end
        end 
    end

    def hidden_ships_grid
        
        hidden_grid = @grid.map do |row|
            row.map do |ele|
                if ele == :S 
                   ele = :N
                else
                    ele
                end         
            end
        end
        hidden_grid
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
