class Player

    def get_move
        p "enter a position with coordinates separated with a space like `4 7`"
        user_input = gets.chomp.split(" ")
        user_input.map! {|ele| ele.to_i}
        return user_input
    end
end
