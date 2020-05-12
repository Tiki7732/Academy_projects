def no_dupes?(array)
    dupeless = []
    array.each_with_index do |ele, index|
        if !array[0...index].include?(ele) && !array[index + 1..-1].include?(ele)
            dupeless << ele
        end
    end
    dupeless
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])  

def no_consecutive_repeats?(array)
    array[0...-1].each_with_index do |ele, index|
       return false if ele == array[index + 1]
    end
    return true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(string)
    indies = Hash.new{ |c, n| c[n] = []}
    string.each_char.each_with_index do |char, index|
        indies[char] << index
    end
    indies
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(string)
    str_arr = string.split("")
    return string[-1] if no_consecutive_repeats?(str_arr)
    string_hash = char_indices(string)
    val = string_hash.values_at(string[0])
    string_hash.each_value do |values|
         val = values if val.length <= values.length
    end
    return string.slice(val[0]..val[-1])
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    factor_arr = []
    (2...num).each do |factor|
        if num % factor == 0 
            factor_arr << num
        end
    end
    if factor_arr.length > 2 
        return false
    else prime?(factor_arr[0]) && prime?(factor_arr[1])
        return true
    end
end

def prime?(num)
    (2...num).each do |factor|
        if num % factor == 0
            return false
        # p num
        # p factor
        end
    end
    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(string, rotate)
    shifted = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    char_move = 0
     string.each_char do |char|
        char_move = 0 if char_move == rotate.length 
        num = rotate[char_move]
        ind = alphabet.index(char)
        if  ind + num <= alphabet.length
            shifted += alphabet[ind + num]
        else
            shifted += alphabet[(ind + num) - alphabet.length]
        end
        char_move += 1
    end
    shifted
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(string)
    vowels = []
    vowel = "aeiou"
    replaced = ""
    string.each_char { |chars| vowels << chars if vowel.include?(chars) }
    vowels.unshift(vowels.pop)
    count = 0
    string.each_char do |char|
        if vowel.include?(char)
            replaced += vowels[count]
            count += 1
        else
            replaced += char
        end
    end
    replaced
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        new_str = ""
        prc ||= Proc.new { return new_str}
    self.each_char do |char|
        new_str += char if prc.call(char)
    end
       new_str     
    end

    def map!(&prc)
        self.each_char.with_index do |char, ind|
            self[ind] = prc.call(char, ind)
        end
        return self
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"

def multiply(num1, num2)
    negative = false
  if num1 < 0 && num2 < 0
    negative = false
    num1 = -num1
    num2 = -num2
  elsif num1 < 0 || num2 < 0
    negative = true
    num1 = -num1 if num1 < 0
    num2 = -num2 if num2 < 0
  end
    if num2 == 1
        # p num1
        return num1
    else 
        product = num1
        product += multiply(num1, num2 - 1)
        
    end
    product = -product if negative
    product
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2
    lucas_arr = lucas_sequence(length - 1)
    lucas_num = lucas_arr[-1] + lucas_arr[-2]
    lucas_arr << lucas_num
    lucas_arr
end

# def lucas_number(num)
#     return 2 if num ==0
#     return 1 if num ==1
#     num = lucas_number(num-1) + lucas_number(num-2)
# end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    primes = []
    if prime?(num)
        primes << num
        return primes
    end
    (2...num).each do |factor|
        if num % factor == 0 && prime?(factor)
            primes << factor
            primes << (num/factor)  
            primes[-1] = prime_factorization(primes[-1])
            return primes.flatten
        end
    end
   
end

#  p prime_factorization(12)     # => [2, 2, 3]
#  p prime_factorization(24)     # => [2, 2, 2, 3]
#  p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]

