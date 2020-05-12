def range(start_num, end_num)
    return [] if start_num >= end_num
    range(start_num, end_num - 1) << end_num - 1
end

def range(start_num, end_num)
    range_arr = []
    return range_arr if end_num < start_num
    (start_num...end_num).each do |num|
        range_arr << num
    end
    range_arr
end

# p range(1, 5)

def expo_1(num, exp)
    return 1 if exp == 0
    result = num * expo_1(num, exp - 1)
end

#p expo_1(2, 50)

def expo_2(num, exp)
    return 1 if exp == 0
    return num if exp == 1
    if exp.even?
        power = expo_2(num, exp / 2)
        result = power * power
    else
        power = expo_2(num,  (exp - 1)/2)
        result = num * power * power
    end
    result
end

#p expo_2(2, 50)

def deep_dup(array)
    dup = []
    array.each do |ele|
        deep_dup(ele) if ele.is_a?(Array)
        dup << ele
    end
    dup
end

# blarg = [7, 8, [9, 0], ["meoow", "woof"], "growl"]
# argl = deep_dup(blarg)
# argl << 8
# p blarg
# p argl

def fibonacci(num)
    return [0] if num == 1
    return [0, 1] if num == 2
    fib = fibonacci(num - 1)
    fib << fib[-2] + fib[-1]
end

# p fibonacci(8)

def bsearch(array, target)
    middle = array.length/2
    return nil if array.empty?
    case target <=> array[middle]
    when -1
        bsearch(array[0...middle], target)
    when 0
        middle
    when 1
        sub_ans = bsearch(array[middle + 1..-1], target)
        sub_ans.nil? ? nil : (middle + 1) + sub_ans
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
    middle = array.length / 2
    return array if middle < 2
    left, right = array[0...middle], array[middle..-1]
    sorted_left, sorted_right = merge_sort(left), merge_sort(right)
    merge(sorted_left, sorted_right)
end

def merge(left, right)
    merged = []
    until left.empty? && right.empty?
        left.each {|num1| merged << left.delete(num1) if right.all?{|num2| num1 < num2}}
        right.each { |num2| merged << right.delete(num2) if left.all?{|num1| num2 < num1}}
    end
    merged
end
# blarg = [77,66,55,3,44,22,8,1,99,5]
# p merge_sort(blarg)
# p merge([3, 4, 5], [6, 1, 2])

def subsets(array)
    return [array, []] if array.length == 1
    count = array.length - 1
    subs = subsets(array.take(count))
    subs.concat(subs.map {|sub| sub + [array.last]})
end

# p subsets([1,2,3, 4])

def permutations(array)
    return [array] if array.length <= 1
    last = array.pop
    perms = permutations(array)
    all_perms = []
    perms.each do |perm|
        (0..perm.length).each do |i|
            all_perms << perm[0...i] + [last] + perm[i..-1]
        end
    end
    all_perms
end

# p permutations([1,2, 3])

# def make_change(target, coins = [25,10,5,1])
#     return [] if target == 0
#     return nil if coins.none?{|coin| coin <= target}
#     coins.sort.reverse
#     best_change = nil
#     coins.each_with_index do |coin, ind|
#         next if coin > target
#         remainder = target - coin
#         best_remainder = make_change(remainder, coins.drop(ind))
#         p best_remainder
#         next if best_remainder.nil?
#         this_change = [coin] + best_remainder
#         if best_change.nil? || (this_change.count < best_change.count)
#             best_change = this_change
#         end
#     end 
#     best_change
# end

def make_greedy_change(amount, coins = [25,10,5,1])
    return [] if amount == 0
    return nil if coins.none?{ |coin| coin <= amount}
    coins.sort.reverse!
    change = []
    coins.each do |coin|
        next if coin > amount
        change << coin
        remainder = amount - coin
        change += make_greedy_change(remainder, coins)
        break
    end
    change
end

p make_greedy_change(30, [25, 12, 10, 1])

def make_better_change(amount, coins = [25,10,5,1])
    return [] if amount == 0
    return nil if coins.none?{ |coin| coin <= amount}
    change = []
    coins.sort.reverse!
    
    coins.each do |coin|
        next if coin > amount
        remainder = amount - coin
        change << coin
        change += make_better_change(remainder, coins)
        break
    end
    other_change = make_better_change(amount, coins.drop(1))
    if !other_change.nil? && other_change.count < change.count 
        change = other_change
    end
    change
end

p make_better_change(30, [25, 12, 10, 1])