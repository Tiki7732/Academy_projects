# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def span
        if self.length == 0
            return nil
        end
        new_arr = self.sort
        return new_arr[-1] - new_arr [0]
    end

    def average
        if self.length == 0
            return nil
        end
        sum = self.sum + 0.00
        return sum / self.length
    end

    def median
        if self.length == 0
            return nil
        end
        new_arr = self.sort
        if self.length % 2 == 0
            mid = new_arr.length / 2
            return (new_arr[mid] + new_arr[mid - 1]) / 2.00
        else
            return new_arr[new_arr.length / 2]
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1}
        return count
    end

    def my_count(num)
        count = self.counts
        return count[num]
    end

    def my_index(val)

        self.each_with_index do |ele, ind|
            if val == ele
                return ind  
            end
        end
        return nil
    end

    def my_uniq
        uni_hash = Hash.new(0)
        self.each { |ele| uni_hash[ele] += 1}
        return uni_hash.keys
    end

    def my_transpose
        new_arr = []
        (0...self.length).each do |ele1|
            trans = []
            (0...self.length).each do |ele2|
                trans << self[ele2][ele1]
            end
            new_arr << trans
        end
       return new_arr
    end
end
