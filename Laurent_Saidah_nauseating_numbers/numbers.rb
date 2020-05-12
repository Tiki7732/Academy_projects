def strange_sums(array)
    count = 0
    array.each_with_index do |num1, ind1|
        array.each_with_index do |num2, ind2|
            if ind1 < ind2
                count += 1 if num1 + num2 == 0
            end
        end
    end
    count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(array, product)
    array.each_with_index do |num1, ind1|
        array.each_with_index do |num2, ind2|
            if ind1 < ind2
                return true if num1 * num2 == product
            end
        end
    end
    return false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(string, repeats)
    repeated = ""
    string.each_char do |char|
        if repeats.has_key?(char)
            repeated += (char * repeats[char])
        else
            repeated += char
        end
    end
    repeated
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    (1..num).each do |base|
        return true if num/base == Math.sqrt(num)
    end
    return false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def num_factors(num)
    count = 0
    (1..num).each {|factor| count += 1 if num % factor == 0}
    return count
end

def anti_prime?(num)
    num_count = num_factors(num)
    (0...num).each do |current|
        current_count = num_factors(current)
        return false if num_count <= current_count
    end
    return true
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(mat1, mat2)
    sum_mat = Array.new(mat1.length) { [0] * mat2[0].length}
    sum_mat.each_with_index do |ele1, ind1|
        ele1.each_with_index do |ele2, ind2|
            sum_mat[ind1][ind2] = mat1[ind1][ind2] + mat2[ind1][ind2]
        end
    end
   sum_mat
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def get_factors(num)
    factor_arr = []
    (1..num).each {|factor| factor_arr << factor if num % factor == 0}
    factor_arr
end

def mutual_factors(*nums)
    factor_hash = Hash.new(0)
    return get_factors(nums[0]) if nums.length == 1
    nums.each do |num|  
        get_factors(num).each { |ele| factor_hash[ele] += 1}
    end
    factor_hash.select{|key, val| val >= nums.length}.keys
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(num)
    if num == 1 || num == 2
        return 1
    elsif num == 3
        return 2
    else
        num = tribonacci_number(num-1) + tribonacci_number(num-2) + tribonacci_number(num-3)
    end
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
    length = matrices.first.length
    height = matrices.first.first.length
    return nil if matrices.any?{|ele| ele.length != length }
    empty_mat = Array.new(length) { [0] * height}
    matrices.inject(empty_mat) do |mat1, mat2|
        matrix_addition(mat1, mat2)
    end
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(double_arr)
    return true if double_arr.any? { |row| row.uniq.length == 1}
    return true if double_arr.transpose.any? { |col| col.uniq.length == 1}
    false
end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false

def squaragonal?(grid)
    diag1 = []
    diag2 = []
    grid.each_with_index { |sub, ind| diag1 << sub[ind] }
    grid.reverse.each_with_index { |sub, ind| diag2 << sub[ind] }
    return true if diag1.uniq.length == 1
    return true if diag2.uniq.length == 1
    false
end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true
p squaragonal?([
    [:b, :o, :x],
    [:b, :x, :b],
    [:b, :b, :b],
]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true
# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false
def sums(arr)
    sum = []
    (0...arr.length-1).each do |num|
        sum << arr[num] + arr[num + 1]
        # p arr[num]
        # p arr[num+1]
    end
    sum
end

def pascals_triangle(height)
    triangle = [[1]]
    while triangle.length < height
        base = triangle.last
        next_lev = [1]
        next_lev += sums(base)
        next_lev << 1
        triangle << next_lev
    end
    triangle
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def prime?(num)
    return false if num < 2
    (2...num).any? {|factor| return false if num % factor == 0}
    return true
end

def mersenne_prime(num)
    m_prime = []
    power = 2
    while m_prime.length < num
        power *= 2
        m_prime << (power - 1) if prime?(power - 1)
    end
    m_prime.last
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(word)
    abcs = ("a".."z").to_a
    value = 0
    word.each_char { |char, ind| value += (abcs.index(char) + 1) } 
    (1..value).each { |i| return true if value == (i * (i+1)) / 2 }
    return false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def collapse(num_arr)
    (0...num_arr.length - 1).each do |n|
        num2 = num_arr[n + 1]
        if num_arr[n] + 1 == num2 || num_arr[n] - 1 == num2
            return num_arr[0...n] + num_arr[n + 2..-1]
        end
    end
    num_arr
end

def consecutive_collapse(arr)
    arr.each { arr = collapse(arr)}
    arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, n)
    if n < 0
        arr.map { |num| prev_prime(num, -n)}
    else
        arr.map { |num| next_prime(num, n)}
    end

end

def next_prime(num, step)
    nums = []
    while nums.length < step
        num += 1
        nums << num if prime?(num)
    end
    nums.last
end

def prev_prime(num, step)
    nums = []
    while nums.length < step
        return nil if num <= 0
        num -= 1
        nums << num if prime?(num)
    end
    nums.last
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

