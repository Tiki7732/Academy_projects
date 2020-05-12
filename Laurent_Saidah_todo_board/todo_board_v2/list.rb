require_relative "item"
class List

    attr_accessor :label
    
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        if !Item.valid_date?(deadline)
            return false
        else
            item = Item.new(title, deadline, description)
            @items << item
        end
        return true
    end

    def size
        return @items.length
    end

    def valid_index?(num)
        return false if num < 0 || num >= self.size
        return true
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)
        @items[index_1],@items[index_2] = @items[index_2], @items[index_1]
        return true
    end

    def [](num)
        return nil if !valid_index?(num)
        return @items[num]
    end

    def priority
        return @items.first
    end

    def print
        length = 15
        body = ""
        body += "-" * (length * 3) + "\n"
        body += @label.ljust(length * 3, " ") + "\n"
        body += "-" * (length * 3) + "\n"
        body += "Index | Item      | Deadline   | Done".ljust(length * 3, " ") + "\n"
        
        @items.each do |ele|
            body += @items.index(ele).to_s.ljust(6, " ") + "| "
            body += ele.title.ljust(10, ' ') + "| "
            body += ele.deadline.ljust(11, ' ') + "|" + ele.status + "\n"
            
        end
        
        body += "-" * (length * 3)
        puts body
    end

    def print_full_item(index)
        body = ""
        body += "-" * 45 + "\n"
        if valid_index?(index)
            body += @items[index].title + " " * 12 + @items[index].deadline + @items[index].status + "\n"
            body += @items[index].description +  "\n"
            
        end
        body +=  "-" * 45
        puts body
        
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        if index - amount <= 0
            index_2 = 0 
        else
            index_2 = index - amount
        end
        if valid_index?(index)
            swap(index, index_2)
            return true
        end
        return false
    end

    def down(index, amount = 1)
        if index + amount >= size
            index_2 = size - 1
        else 
            index_2 = index + amount
        end
        if valid_index?(index)
            swap(index, index_2)
            return true
        end
        return false
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline} 
    end

    def toggle_item(index)
        @items[index].toggle if valid_index?(index)
    end

    def remove_item(index)
        if valid_index?(index)
            @items.delete_at(index) 
            return true
        end
        return false
    end

    def purge
        @items.delete_if {|item| item.done} 
    end
end

# my_list = List.new('Groceries')
# my_list.add_item('shampoo', '2019-10-24')
# my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
# my_list.add_item('toothpaste', '2019-10-25')
# my_list.add_item('toothbrush', '2020-8-15')
# p my_list

# p my_list
# p my_list.add_item('shampoo', '10-24-2019') # invalid date

# p my_list
# p my_list.size
# p my_list.valid_index?(3)
# p my_list.valid_index?(1)
# p my_list.valid_index?(-1)

# p my_list
# my_list.swap(0, 2)
# p my_list
# p my_list.swap(0, 9)
# p my_list[1]
# my_list.print

# my_list.print
# my_list.sort_by_date!
# my_list.print
# my_list.print_full_item(2)
#   my_list.toggle_item(2)
#   my_list.toggle_item(3)
# my_list.print_full_item(2)
# my_list.print_priority
# p my_list.up(3, 8)
# my_list.print
# my_list.print
# my_list.down(0)
# my_list.print
# my_list.purge
# my_list.remove_item(2)
# my_list.print
