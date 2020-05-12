class Array

  def my_each(&prc)
      ind = 0
      while ind < self.length 
          prc.call(self[ind])
          ind += 1
      end
      return self
  end

  def my_select(&prc)
    select = []
    self.my_each do |item|
      select << item if prc.call(item)
    end
    return select
  end

  def my_reject(&prc)
    select = []
    self.my_each do |item|
      select << item if !prc.call(item)
    end
    select
  end

  def my_any?(&prc)
    self.my_each { |item| return true if prc.call(item) }
    return false
  end

  def my_all?(&prc)
    self.my_each { |item| return false if !prc.call(item)}
    return true
  end

  def my_flatten
    flat = []
    self.my_each do |item|
      if item.kind_of?(Array)
        flat += item.my_flatten
      else
        flat << item
      end
    end
    flat
  end

  def my_zip(*arrays)
    zipped = []
    self.each_with_index do |ele, ind|
      sub = [ele]
      arrays.each { |arr| sub << arr[ind] }
      zipped << sub
    end
    zipped
  end

  def my_rotate(num = 1)
    rotate = self.dup
    if num > 0 
      num.times {rotate.push(rotate.shift)}
    else
      (-num).times {rotate.unshift(rotate.pop) }
    end
    rotate
  end 

  def my_join(sep = "")
    joined = ""
    self[0...-1].each do |char|
      joined += char + sep
    end
    joined += self[-1]
    joined
  end

  def my_reverse
    reversed = []
    self.my_each do |ele|
      reversed.unshift(ele)
    end
    reversed
  end

  def bubble_sort!(&prc)
    sorted = false
    while !sorted
      sorted = true
      (0...self.length - 1).each do |i|
        if prc.call(self[i], self[i + 1]) == 1
          self[i], self[i+1] = self[i + 1], self[i]
          sorted = false
        end
      end
      
    end
    self
  end

  def bubble_sort(&prc)
    sorted = self.dup
    sorted.bubble_sort!(&prc)
  end
end


def factors(num)
  factor_arr = []
  (1..num).each {|i| factor_arr << i if num % i == 0}
  factor_arr
end

def substrings(word)
  subs = []
  (0...word.length).each do |start_ind|
    (start_ind...word.length).each do |end_ind|
      sub = word[start_ind..end_ind]
      subs << sub
    end
  end
  subs
end

def subwords(word, dictionary)
  valid_words = substrings(word).select {|sub| sub if dictionary.include?(sub)}
  valid_words.uniq
end





# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# p return_value
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]
# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [1].my_reverse

# p factors(12)
# p factors(200)

# bub = [2, 4 ,5, 3, 1, 8, 10]
#  p bub.bubble_sort{ |num1, num2| num1 <=> num2 }
#  p bub

# p substrings("Laurent")
# dictionary = ["bears", "ear", "a", "army"]
# p subwords("erbearsweatmyajs", dictionary)


