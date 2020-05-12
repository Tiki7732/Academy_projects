# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    factors = []
    (2..num).each do |i|
        if num % i == 0
            factors << i
        end
    end
       #debugger
    primes = []
    factors.each do |i|
        if prime?(i)
            primes << i
        end
    end
    return primes[-1]
end

def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end     
    end
    return true
end

def unique_chars?(word)
    charac = Hash.new(0) 
    word.each_char do |char|
        charac[char] += 1
    end
    charac.each_value do |val|
        #debugger
        if val > 1
            return false
        end
    end
    return true
end

def dupe_indices(array)
    dupes = Hash.new { |h, k| h[k] = [] }
    array.each_with_index do |ele, ind|
        dupes[ele] << ind
    end
    dupes.select { |ele, arr| arr.length > 1 }

    # dupes = Hash.new(0)
    # dupe_ind = Hash.new(0)
    # array.each do |ele|
    #     dupes[ele] += 1
    # end   
    # dupes.each_key do |key|
    #     ind = []
    #     #debugger
    #      if dupes[key] > 1
    #         array.each_with_index do |ele, i|          
    #             if ele == key
    #                 ind << i
    #             end
    #         end
    #         dupe_ind[key] = ind
    #     end
    # end
    # return dupe_ind
end

def arr_count(array)
    count = Hash.new(0)
    array.each do |ele|
        count[ele] += 1
    end
    return count
end

def ana_array(arr1, arr2)
count1 = arr_count(arr1)
count2 = arr_count(arr2)
count1 == count2

    # arr1.each do |ele|
    #     if !arr2.include?(ele)
    #         return false
    #     end
    # end
    # arr2.each do |ele|
    #     if !arr1.include?(ele)
    #         return false
    #     end
    # end
    # return true
end