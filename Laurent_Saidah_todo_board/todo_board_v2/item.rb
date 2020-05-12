class Item

    attr_accessor :title, :deadline, :description
    attr_reader :done
    def self.valid_date?(date)
        date_arr = date.split("-").map { |ele| ele.to_i}
        count = 0
        count += 1 if date_arr[0] > 999 && date_arr[0] <= 9999
        count += 1 if date_arr[1] > 0 && date_arr[1] < 13
        count += 1 if date_arr[2] > 0 && date_arr[2] < 32
        return true if count == 3
        return false
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline 
        else
            raise p "Not the correct date format"
        end
        @description = description
        @done = false
    end

    def deadline=(new_date)
       if Item.valid_date?(new_date)
            @deadline = new_date
        else
            raise p "Not the correct date format"
        end
    end

    def toggle
        @done = !@done
    end

    def status
        stat =  " [X] " if done
        stat = " [ ] " if !done
        return stat
    end
end
# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
# p my_item
# my_item.title
# my_item.description = 'It loads waaaaaay too slow!'
# p my_item
# my_item.deadline = "2019-10-23"
# p my_item
