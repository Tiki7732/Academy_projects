def select_even_nums(array)
    evens = array.select(&:even?)
end

def reject_puppies(array)
    old_dogs = array.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays(array)
    count = array.count {|sub_arr| sub_arr.sum > 0}
end

def aba_translate(string)
    vowels = "aeiou"
    trans = ""
    string.each_char do |char|
        trans += char
        if vowels.include?(char)
            trans += "b"
            trans += char
        end
    end
    trans
end

def aba_array(array)
    trans_arr = array.map {|word| aba_translate(word)}
end