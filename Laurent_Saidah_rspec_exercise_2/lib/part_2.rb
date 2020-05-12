def palindrome?(word)
    reverse = ""
    i = word.length - 1
    while i >= 0
        reverse += word[i]
        i -= 1
    end
    if reverse == word
        return true
    else
        return false
    end
end

def substrings(word)
    subs = []
    substr = ""
    word_arr = word.split("")
    word_arr.each_index do |ind1|
        i = ind1
        while i < word.length
            if i == ind1
                subs << word_arr[ind1]
                substr = word_arr[ind1]
                i +=1
            else
                substr += word_arr[i] 
                subs << substr
                i += 1
            end
        end
    end
    return subs
end

def palindrome_substrings(word)
    subs = substrings(word)
    palin_subs = []
    subs.each do |ele|
        if ele.length > 1 && palindrome?(ele)
            palin_subs << ele
        end
    end
    return palin_subs
end