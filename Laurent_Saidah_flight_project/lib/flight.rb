class Flight
    attr_reader :passengers

    def initialize(flight_num, capacity)
        @flight_number = flight_num
        @capacity = capacity
        @passengers = []
    end

    def full?
        passengers.length == @capacity
    end    

    def board_passenger(passenger)
         @passengers << passenger if !full? && passenger.has_flight?(@flight_number)
    end

    def list_passengers
        names = []
        @passengers.each {|pass| names << pass.name}
        names
    end

    def []num
        @passengers[num]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end
end