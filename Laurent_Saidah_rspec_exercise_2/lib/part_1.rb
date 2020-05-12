def partition(array, num)
   parted = []
   part1 = []
   part2 = []
   array.each do |ele|
        if ele < num
            part1 << ele
        end
        if ele >= num
            part2 << ele
        end
   end
 
    parted << part1
    parted << part2
    return parted
end

def merge(hash1, hash2)
    hash3 = Hash.new(0)
    hash1.each do |key1, val1|
        hash2.each do |key2, val2|
            if key1 == key2
                hash3[key2] = val2
            else
                hash3[key1] = val1
                hash3[key2] = val2
            end
        end
    end
    hash3
end

def censor(str, array)
    vowels = "aeiou"
    cursed = str.split(" ")
    censored = ""
    new_sent = []

    cursed.each do |ele|
        if array.include?(ele.downcase)
            ele.each_char do |char|
                if !vowels.include?(char.downcase)
                    censored += char
                else
                    censored += "*"
                end
                
            end
            new_sent << censored
            censored = ""
        else
            new_sent << ele
            
        end
    end
    return new_sent.join(" ")
end

def power_of_two?(num)
    if Math.log2(num) % 1 == 0
        return true
    else
        return false
    end
end
