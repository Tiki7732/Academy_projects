class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    pegs.each do |peg|
      if !POSSIBLE_PEGS.include?(peg.upcase)
        return false
      end
    end
    return true
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map {|peg| peg.upcase}
    else
      raise "These aren't valid pegs!"
    end
  end
    def self.random(length)
      random_pegs = []
      length.times {random_pegs << POSSIBLE_PEGS.keys.sample}
      Code.new(random_pegs)
    end

    def self.from_string(string)
      pegs_arr = string.split("")
      Code.new(pegs_arr)
    end

    def [](index)
      @pegs[index]
    end

    def length
      @pegs.length
    end

    def length?(guess)
      pegs.length == guess.length
    end

    def num_exact_matches(guess)
      exact_match = 0
      if !length?(guess)
        raise "Your code is the wrong length!"
      end
      @pegs.each.with_index do |peg, index|
        exact_match += 1 if peg == guess.pegs[index]
      end
      return exact_match
    end

    def num_near_matches(guess)
      near_match = 0
      @pegs.each.with_index do |peg, index|
        if @pegs.include?(guess.pegs[index]) && peg != guess.pegs[index]
          near_match +=1
        end
      end
      return near_match
    end

    def ==(guess)
     self.pegs == guess.pegs
    end
end
