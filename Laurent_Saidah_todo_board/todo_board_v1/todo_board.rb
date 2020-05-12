require_relative "item"
require_relative "list"

class TodoBoard

    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        command, *args = gets.chomp.split(" ")
        case command
        when 'mktodo'
            @list.add_item(*args)
            return true
        when 'up'
            @list.up(args.first.to_i) if args.length == 1
            @list.up(args.first.to_i, *args.last.to_i) if args.length > 1
            return true
        when 'down'
            @list.down(args.first.to_i) if args.length == 1
            @list.down(args.first.to_i, *args.last.to_i) if args.length > 1
            return true
        when 'swap'
            @list.swap(args.first.to_i, *args.last.to_i)
            return true
        when 'sort'
            @list.sort_by_date!
            return true
        when 'priority'
            @list.print_priority
            return true
        when 'print'
            # p args.first
            @list.print if args.length == 0
            @list.print_full_item(args.first.to_i) if args.length != 0
            return true
        when 'quit'
            return false
        when 'toggle'
            @list.toggle_item(args.first.to_i)
            return true
        when 'rm'
            @list.remove_item(args.first.to_i)
            return true
        when 'purge'
            @list.purge
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

t = TodoBoard.new("grocieries")
t.run