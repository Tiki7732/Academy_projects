# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    mult_1 = []
    mult_2 = []
    (1..num_2).each do |num|
        mult_1 << num * num_1
    end
     (1..num_1).each do |num|
        mult_2 << num * num_2
    end
    mult_1.each {|num| return num if mult_2.include?(num)}
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigram_hash = Hash.new(0)
    (0...str.length - 1).each do |ind|
        sub = str[ind..ind + 1]
        bigram_hash[sub] += 1
    end
    biggest = bigram_hash.values.sort.reverse!
    return bigram_hash.key(biggest[0])
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        inverted = {}
        self.each do |k, v|
            inverted[v] = k
        end
        inverted
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        self.each_with_index do |num1, ind1|
            self.each_with_index do |num2, ind2|
               count +=1 if (ind2 > ind1) && (num1 + num2 == num)
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        sorted = false
        prc ||= Proc.new { |a, b| a <=> b}
        while !sorted
            sorted = true
            (0...self.length - 1).each do |ind|
                if prc.call(self[ind], self[ind+1]) == 1
                    self[ind], self[ind+1] = self[ind+1], self[ind]
                    sorted = false
                end
            end
        end
        return self

    end
end
