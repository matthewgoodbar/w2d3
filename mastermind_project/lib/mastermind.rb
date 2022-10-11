require_relative "code"

class Mastermind
  def initialize(n)
    @secret_code = Code.random(n)
  end

  def print_matches(guess)
    puts "Exact matches: " + @secret_code.num_exact_matches(guess).to_s
    puts "Near Matches: " + @secret_code.num_near_matches(guess).to_s
  end

  def ask_user_for_guess
    begin
        puts "Enter a code: "
        user_input = gets.chomp
        guess = Code.from_string(user_input)
    rescue
        puts "Invalid code! Try again."
        retry
    end
    print_matches(guess)
    return @secret_code == guess
  end
end
