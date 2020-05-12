require_relative "room"

class Hotel
  
    def initialize(name, hash)
        @name = name
         @rooms = Hash.new
        hash.each do |key, val|
            @rooms[key] = Room.new(val)
        end
    end

    def name
        upper_name = @name.split(" ")
        upper_name.map {|ele| ele.capitalize!}
        return upper_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        @rooms.has_key?(room)
    end

    def check_in(person, room)
        if self.room_exists?(room) 
            if @rooms[room].add_occupant(person)
                p "check in successful"
            else
                p "sorry room is full"
            end
        else
            p "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each_key do |key| 
            if @rooms[key].full?
                return false
            end
            return true
        end
    end

    def list_rooms
        @rooms.each {|name, room| puts "#{name} : #{room.available_space}" }
        
    end
end
