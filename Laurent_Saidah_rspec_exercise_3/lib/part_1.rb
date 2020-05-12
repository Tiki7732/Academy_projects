def is_prime?(num)
    return false if num < 2
    (2...num).none? {|factor| num % factor == 0}
end

def nth_prime(num)
    prime_arr = []
    prime = 2
    while prime_arr.length < num
        prime_arr << prime if is_prime?(prime)
        prime += 1
    end
    prime_arr[-1]
end

def prime_range(min, max)
    prime_arr = []
    prime = min
    while prime <= max
        prime_arr << prime if is_prime?(prime)
        prime += 1
    end
    prime_arr
end