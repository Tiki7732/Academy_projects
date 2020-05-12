def average(num1, num2)
    aver = (num1 + num2)/2.0
    return aver
end

def average_array(arr)
    total = 0.0
    aver = 0.0
   arr.each do |ele|
   total += ele
   end
   aver = total/arr.length
   return aver
end

def repeat(str, num)
    new_str = ""
    num.times {new_str += str}
    return new_str
end

def yell(str)
    return str.upcase + "!"
end

def alternating_case(str)
    sent_arr = str.split(" ")
    alt_arr = []
    i = 0
    while i < sent_arr.length
        alt_arr << sent_arr[i].upcase
        alt_arr << sent_arr[i+1].downcase
        i += 2
    end
    alt_str = alt_arr.join(" ")
    return alt_str

end