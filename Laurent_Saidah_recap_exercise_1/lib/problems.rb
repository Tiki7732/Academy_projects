# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    vowels = "aeiou"
    pairs = ""
    pair_arr = []
    words.each.with_index do |word1, ind1|
        words.each.with_index do |word2, ind2|
             if (ind2 > ind1) && (vowels == (return_vowels(word1, word2)))
                return_vowels(word1, word2)
                pairs = word1 + " " + word2
                pair_arr << pairs
         end
        end
    end
    return pair_arr
end

def return_vowels(word1, word2)
    vowel_hash = Hash.new(0)
    vowels = "aeiou"
    word1.each_char do |char|
      vowel_hash[char] += 1  if vowels.include?(char)
    end
     word2.each_char do |char|
      vowel_hash[char] += 1  if vowels.include?(char)
    end
    return vowel_hash.keys.sort.join("")
    
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    factors = []
    (2...num).each do |ele|
       return true if num % ele == 0
    end
    return false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    big_arr = []
    bigrams.each do |ele|
        big_arr << ele if str.include?(ele)
    end
    big_arr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        new_hash = Hash.new(0)
        prc ||= Proc.new {|k, v| v if k == v}
        self.each do |k, v|
            new_hash[k] = v if prc.call(k, v)
        end
        new_hash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        sub_arr = []
        (0...self.length).each do |start_ind|
            (start_ind...self.length).each do |end_ind|
                sub = self[start_ind..end_ind]
                sub_arr << sub
            end
        end
        if length.nil?
            sub_arr
        else
            sub_arr.select { |subs| subs.length == length}
        end
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        shifted = ""
        alphabet = "abcdefghijklmnopqrstuvwxyz"
        self.each_char do |char|
            ind = alphabet.index(char)
            if  ind + num <= alphabet.length
                shifted += alphabet[ind + num]
            else
                shifted += alphabet[(ind + num) - alphabet.length]
            end
        end
        shifted
    end
end