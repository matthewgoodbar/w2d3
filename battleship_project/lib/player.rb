class Player
  def get_move
    puts "enter a position with coordinates separated with a space like `4 7`"
    coords = gets.chomp.split(" ")
    return [coords[0].to_i, coords[1].to_i]
  end
end
