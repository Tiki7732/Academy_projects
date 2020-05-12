require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        p @secret_code.num_exact_matches(guess)
        p @secret_code.num_near_matches(guess)
    end

    def ask_user_for_guess
        p "Enter a code"
        user_input = gets.chomp
         guess = Code.from_string(user_input)
        #  if @secret_code.length?(guess)
        #     raise "Your code is the wrong lenght!"
        #  end
         self.print_matches(guess)
         @secret_code == guess
    end

end
