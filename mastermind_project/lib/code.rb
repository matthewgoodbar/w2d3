class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.each {|char| return false if POSSIBLE_PEGS[char.upcase] == nil}
    return true
  end

  def initialize(arr)
    raise RuntimeError.new "Invalid pegs" unless Code.valid_pegs?(arr)
    @pegs = arr.map(&:upcase)
  end

  def self.random(n)
    res = []
    n.times {res << (POSSIBLE_PEGS.keys).sample}
    return Code.new(res)
  end

  def self.from_string(str)
    chars = str.split("")
    return Code.new(chars)
  end

  def [](index)
    return @pegs[index]
  end

  def length
    return @pegs.length
  end

  def num_exact_matches(guess)
    correct_count = 0
    @pegs.each_with_index {|actual, i| correct_count += 1 if actual == guess[i]}
    return correct_count
  end

  def num_near_matches(guess)
    #Create two arrays from secret and guess, excluding exact matches
    secret_left = []
    guess_left = []
    near_count = 0
    @pegs.each_with_index do |actual, i|
      unless actual == guess[i]
        secret_left << @pegs[i]
        guess_left << guess[i]
      end
    end
    #Pick off elements of what's left of guess
    #Check if it's in what's left of secret, if so increment count and remove from secret
    until guess_left.length == 0
      guess_peg = guess_left.pop
      if secret_left.include?(guess_peg)
        near_count += 1
        secret_left.delete_at(secret_left.index(guess_peg))
      end
    end
    return near_count
  end

  def ==(guess)
    return false if self.length != guess.length
    @pegs.each_with_index {|el, i| return false unless el == guess[i]}
    return true
  end

end
