#Problem 1: 

def sum_recur(array)
    return array[0] if array.length == 1
    sum = sum_recur(array[0...array.length - 1]) + array[-1]
end

#p sum_recur([1,2,3,4,5, 6])

#Problem 2: 

def includes?(array, target)
    return false if array.length == 0
    return true if target == array.pop
    includes?(array, target)
    
end

# p includes?(["meow", "3", 21, "boo", "woof"], "woof")

# Problem 3: 

def num_occur(array, target)
    count = 0
    return count if array.length == 0
    first = array.shift
    count += 1 if first == target
    count += num_occur(array, target)
    count
end

# p num_occur([2, 4, 2,6, 2, 8, 2, 2 ,2 ,2], 2)

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length == 1
    first = array.shift
    second = array[0]
    return true if first + second == 12
    add_to_twelve?(array)
end

# p add_to_twelve?([1, 2, 3, 5, 7, 9, 2, 9])

# Problem 5: 

def sorted?(array)
    return true if array.length == 1
    first = array.shift
    second = array[0]
    return false if first > second
    sorted?(array)
end

# p sorted?([2,4,6,7,8])

# Problem 6: 

def reverse(string)
    last_char = string[-1]
    return last_char if string.length == 1
    rever_string = last_char + reverse(string[0...-1])
end

p reverse("hello babe")
p reverse("Laurent Saidah")
p reverse("Christine Williams")
