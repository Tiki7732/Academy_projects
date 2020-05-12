def reverser(word, &prc)
    reverse = word.reverse
    return prc.call(reverse)
end

def word_changer(sentence, &prc)
    sent = sentence.split(" ")
    return sent.map(&prc).join(" ")
end

def greater_proc_value(num, prc1, prc2)
    if prc1.call(num) > prc2.call(num)
        return prc1.call(num)
    else
        return prc2.call(num)
    end
end

def and_selector(array, prc1, prc2)
   new_arr =  []
   array.each do |ele| 
        if prc1.call(ele) && prc2.call(ele)
            new_arr << ele
        end
    end
    return new_arr
end

def alternating_mapper(array, prc1, prc2)
    new_arr = []
    array.each_index do |i|
        if i == 0 || i % 2 == 0
            new_arr << prc1.call(array[i])
        else
            new_arr << prc2.call(array[i])
        end
    end
    return new_arr
end