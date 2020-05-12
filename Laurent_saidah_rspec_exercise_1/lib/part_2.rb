def hipsterfy(str)
    vowels = "aeiou"
    i = str.length - 1
    while i >= 0
        if vowels.include?(str[i])
            return str[0...i] + str[i+1..-1]
        end
        i -= 1
    end
    return str

end

def vowel_counts(str)
    vowels = Hash.new(0)
    vowel = "aeiou"
    vow_arr = str.downcase.split("")
    vow_arr.each do |i|
        if vowel.include?(i)
            vowels[i] += 1
        end
    end
    return vowels
end

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_word = ""
    shiftnum = 0
   
    str.each_char do |i|
        if alphabet.include?(i)
           if (alphabet.index(i) + num) >= alphabet.length
            shiftnum = (alphabet.index(i) + num) % alphabet.length
            #p alphabet[shiftnum]
            new_word += alphabet[shiftnum]
            #p new_word
           else
            new_word += alphabet[alphabet.index(i) + num]
            #p new_word
           end
        
        else
            new_word += i
        end
    end
    return new_word
end