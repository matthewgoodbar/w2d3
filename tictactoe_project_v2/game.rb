require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(n, *player_marks)
        @player_array = []
        player_marks.each {|mark| @player_array << HumanPlayer.new(mark)}
        @board = Board.new(n)
        @current_player = @player_array[0]
    end

    def switch_turn
        @player_array.rotate!
        @current_player = @player_array[0]
    end

    def play
        victory = false
        draw = false
        game_over = false
        until game_over
            @board.print
            user_input = @current_player.get_position
            @board.place_mark(user_input, @current_player.mark_value)
            victory = @board.check_victory(@current_player.mark_value)
            draw = !@board.empty_positions?
            game_over = victory || draw
            switch_turn if !game_over
        end
        @board.print
        if victory
            puts "Game Over! " + @current_player.mark_value.to_s + " player wins!"
        else
            puts "Draw!"
        end
    end
end