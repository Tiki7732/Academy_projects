def zip(*arr)
    iter = arr[0].length
    (0...iter).map do |ele|
        arr.map {|sub| sub[ele]}
    end
end

def prizz_proc(arr, prc1, prc2)
    arr.select do |ele|
        (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))
    end
end

def zany_zip(*arr)
    length = 0
    arr.each {|ele| length = ele.length if length < ele.length}
    (0...length).map do |ele|
        arr.map {|sub| sub[ele]}
    end
end

def maximum(arr, &prc)
    largest = arr[0]
    return nil if arr.length == 0
    arr.each do |ele|
        if prc.call(largest) <= prc.call(ele)
            largest = ele
        end
    end
    largest
end

def my_group_by(arr, &prc)
    ele_hash = Hash.new{|key, val| key[val] = Array.new()}
    arr.each { |ele| ele_hash[prc.call(ele)] << ele }
    ele_hash
end

def max_tie_breaker(arr, tie_block, &prc)
    return nil if arr.empty?
    largest = arr[0]
    arr.each do |ele|
        result = prc.call(ele)
        max_result = prc.call(largest)
        if max_result < result
            largest = ele
        elsif max_result == result && tie_block.call(ele) > tie_block.call(largest)
            largest = ele
        end
    end
    largest     
end

def vowel_count(word)
    count = 0
    vowels = "aeiou"
    word.each_char {|char| count += 1 if vowels.include?(char)}
    count
end

def v_indies(word)
    vowels = "aeiou"
    indicies = []
    word.each_char.with_index {|char, i| indicies << i if vowels.include?(char)}
    indicies
end

def change_word(word)
    indies = v_indies(word)
    new_word = word[indies[0]..indies[-1]]
    return new_word
end

def silly_syllables(sent)
    sent_arr = sent.split(" ")
    new_sent = []
    sent_arr.each do |word|
        if vowel_count(word) >= 2
            new_sent << change_word(word)
        else
            new_sent << word
        end
    end
    return new_sent.join(" ")
end