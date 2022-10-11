class Board

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
    @n = n
  end

  def [](indices)
    return @grid[indices[0]][indices[1]]
  end  

  def []=(indices, value)
    @grid[indices[0]][indices[1]] = value
  end

  def num_ships
    sum = 0
    @grid.each do |row|
      row.each {|el| sum += 1 if el == :S}
    end
    return sum
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    ships_to_place = @size / 4
    until ships_to_place == 0
      random_position = [rand(@n), rand(@n)]
      next if already_ship_there?(random_position)
      self[random_position] = :S
      ships_to_place -= 1
    end
  end

  def already_ship_there?(position)
    return self[position] == :S
  end

  def hidden_ships_grid
    res = []
    @grid.each do |row|
      res << row.map {|el| el == :S ? :N : el}
    end
    return res
  end

  def self.print_grid(arr)
    arr.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
