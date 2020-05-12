def duos(word)
    ind = 0
    word[0...-1].each_char.with_index do |char, ind|
        ind += 1 if char == word[ind + 1]
    end
    ind
end
# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    swapped = []
    sent.split(" ").each do |word|
        if hash.key?(word)
            swapped << hash[word]
        else
            swapped << word
        end
    end
    swapped.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped(hash, val_change, &key_change)
    mapped = {}
    hash.each do |key, val|
        mapped[key_change.call(key)] = val_change.call(val)
    end
    mapped
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def inded_characters(word)
    char_hash = Hash.new(0)
    word.each_char { |char| char_hash[char] += 1}
    char_hash.keep_if{|k, v| v > 2}
    char_hash.keys
end

# p inded_characters("that's alright folks") # ["t"]
# p inded_characters("mississippi") # ["i", "s"]
# p inded_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p inded_characters("runtime") # []

def triplet_true(word)
    ind = 0
    word[0...-1].each_char.with_index { |char, ind| ind += 1 if char == word[ind + 1] }
    return true if ind > 2
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(sent, code)
    coded = ""
    sent.each_char do |char|
        if char == ' '
            coded += char
        elsif code.has_key?(char)
            coded += code[char]
        else
            coded += "?"
        end
    end
    coded
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(word)
    comp = word.split("")
    new_word = ""
    ind = 0
    while ind < comp.length
        new_word += comp[ind] * comp[ind + 1].to_i
        ind += 2
    end
    new_word
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    selected = arr
    prcs.each do |prc|
        selected.select! {|ele| prc.call(ele)}
    end
    selected
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sentence)
    trans = []
    sentence.split(" ").each do |word|
        if word.length < 3
            trans << word
        elsif word == word.capitalize
            trans << pig_latin(word).capitalize
        else
            trans << pig_latin(word)
        end
    end
    trans.join(" ")
end

def pig_latin(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char.with_index do |char, ind|
        if vowels.include?(char.downcase) && ind == 0
            return new_word += word + "yay"
        elsif vowels.include?(char) 
            return new_word += char + word[ind+1..-1] + word[0...ind].downcase + "ay"
        end
    end
    new_word
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# p pig_latin("Like")

def reverberate(sent)
    trans = []
    sent.split(" ").each do |word|
        if word.length < 3
            trans << word
        elsif word == word.capitalize
            trans << rever(word).capitalize
        else
            trans << rever(word)
        end
    end
    trans.join(" ")
end

def rever(word)
    vowels = "aeiou"
    new_word = ""
    if vowels.include?(word[-1])
        return new_word += word * 2
    else
        word.reverse.each_char.with_index do |char, ind|
            if vowels.include?(char)
                return new_word += word + word[-1 -ind..-1]
            end
        end
    end
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr, *prcs)
    selected = []
    arr.each do |ele|
       prcs.each {|prc| selected << ele if prc.call(ele)}
    end
    selected.uniq
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)
    alt_sent = sent.split(" ")
    alt_sent.each_with_index do |word, ind|
        if ind.even? || ind == 0
            alt_sent[ind] = removed(alt_sent[ind])
        else
            alt_sent[ind] = removed(alt_sent[ind].reverse).reverse
        end
    end
    alt_sent.join(" ")
end

def removed(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char.with_index do |char, ind|
       return new_word += word[0...ind] + word[ind + 1..-1] if vowels.include?(char)
    end
end

#  p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
#  p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
#  p alternating_vowel('code properly please') # "cde proprly plase"
#  p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

# # p removed("panthers")
# # p removed("panthers".reverse).reverse

def silly_talk(sent)
    trans = []
    sent.split(" ").each do |word|
        if word.length < 3
            trans << word
        elsif word == word.capitalize
            trans << silly(word).capitalize
        else
            trans << silly(word)
        end
    end
    trans.join(" ")
end

def silly(word)
    vowels = "aeiou"
    new_word = ""
    if vowels.include?(word[-1])
        return new_word = word + word[-1]
    else
        word.each_char do |char|
            new_word += char
            new_word += "b" + char if vowels.include?(char.downcase)
        end
    end
    new_word 
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(word)
    ind = 0
    char_arr = []
    count_arr = []
    count = 1
    new_word = ""
    while ind < word.length 
        while word[ind] == word[ind + 1]
            count += 1
            ind += 1
            # p count
            # p word[ind]
        end
        count_arr << count
        char_arr << word[ind]
        count = 1
        ind += 1
    end
    char_arr.each_with_index do |char, ind|
        new_word += char 
        new_word += count_arr[ind].to_s if count_arr[ind] > 1 
   end
   new_word
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"