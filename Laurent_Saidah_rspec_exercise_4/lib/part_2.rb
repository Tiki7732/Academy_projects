def proper_factors(num)
    factors = []
    (1...num).each {|factor| factors << factor if num % factor == 0}
    factors
end

def aliquot_sum(num)
    sum = proper_factors(num).inject{|num1, num2| num1 + num2}
    sum
end

def perfect_number?(num)
    return true if num == aliquot_sum(num)
    return false
end

def ideal_numbers(num)
    ideal_arr = []
    ideal_num = 1
    while ideal_arr.length < num
        ideal_arr << ideal_num if perfect_number?(ideal_num)
        ideal_num += 1
    end
    ideal_arr
end