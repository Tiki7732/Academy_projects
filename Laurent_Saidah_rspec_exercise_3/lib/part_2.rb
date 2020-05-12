def element_count(arr)
    count = Hash.new(0)
    arr.each {|ele| count[ele] += 1}
    count
end

def char_replace!(string, hash)
    string.each_char.with_index do |char, ind|
        if hash.has_key?(char)
            string[ind] = hash[char]
        end
    end
    string
end

def product_inject(arr)
    arr.inject {|product, num| product * num}
end