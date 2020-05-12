class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = []
    @secret_word.length.times {@guess_word << "_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end
    return false
  end

  def get_matching_indices(char)
    indices = []
    char_arr = @secret_word.split("")
    char_arr.each_index do |i|
      if char_arr[i] == char
        indices << i
      end
    end
    return indices
  end
  
  def fill_indices(char, indices)
    indices.each do |ele|
      @guess_word[ele] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        indices = self.get_matching_indices(char)
        self.fill_indices(char, indices)
      end
      return true
    end
  end

  def ask_user_for_guess()
    p "Enter a char: "
    char = gets.chomp.downcase
    return self.try_guess(char)
  end

  def win?
    if @secret_word == @guess_word.join("")
      p "WIN"
      return true
    end
    return false
  end

  def lose?
    if  remaining_incorrect_guesses == 0
      p "LOSE"
      return true

    end
    return false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
