class Card

    attr_reader :face_val
    attr_accessor :face_up

    def initialize(face_val)
        @face_up = false
        @face_val = face_val
    end

    def ==(card)
        self.face_val == card.face_val
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s 
        if @face_up
           "#{@face_val}"
        else
            " "
        end
    end
end

# c = Card.new('f')
#  puts c
#  c.reveal
# puts c
# d = Card.new('f')
# p c != d
# puts c.face_val
# p c.reveal
