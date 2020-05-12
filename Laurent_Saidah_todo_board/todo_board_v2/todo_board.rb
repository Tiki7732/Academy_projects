require_relative "item"
require_relative "list"

class TodoBoard

    def initialize
        @list = {}
        
    end

    def get_command
        print "\nEnter a command: "
        command, label, *args = gets.chomp.split(" ")
        case command
        when 'mklist'
            @list[label] = List.new(label)
            return true
        when 'ls'
            @list.keys.each {|key| p key}
            return true
        when 'showall'
            @list.each_key { |key| @list[key].print}
            return true
        when 'mktodo'
            @list[label].add_item(*args)
            return true
        when 'up'
            @list[label].up(args.first.to_i) if args.length == 1
            @list[label].up(args.first.to_i, *args.last.to_i) if args.length > 1
            return true
        when 'down'
            @list[label].down(args.first.to_i) if args.length == 1
            @list[label].down(args.first.to_i, *args.last.to_i) if args.length > 1
            return true
        when 'swap'
            @list[label].swap(args.first.to_i, *args.last.to_i)
            return true
        when 'sort'
            @list[label].sort_by_date!
            return true
        when 'priority'
            @list[label].print_priority
            return true
        when 'print'
            # p args.first
            @list[label].print if args.length == 0
            @list[label].print_full_item(args.first.to_i) if args.length != 0
            return true
        when 'quit'
            return false
        when 'toggle'
            @list[label].toggle_item(args.first.to_i)
            return true
        when 'rm'
            @list[label].remove_item(args.first.to_i)
            return true
        when 'purge'
            @list[label].purge
            return true
        else
            p "Sorry, that command was not recognized"
            return true
        end
    end

    def run
        while get_command
        end
    end

end

t = TodoBoard.new()
t.run