require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(player1_mark, player2_mark)
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
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