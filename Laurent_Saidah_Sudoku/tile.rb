require 'rubygems'
require 'colorize'


class Tile

    attr_reader :given
    def initialize(value)
        @value = value
        @given = value == 0 ? false : true
    end

    def value=(new_value)
        if @given
            puts "You can't change this tile"
        else
            @value = new_value
        end 
    end

    def color
        @given ? :blue : :red
    end

    def to_s
        @value == 0 ? " " :  @value.to_s.colorize(self.color)
    end

    def value
        @value
    end
end

# t = Tile.new(0)
# puts t.to_s
# t.value = 1
# puts t.to_s
