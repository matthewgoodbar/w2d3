require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game
    def initialize(n=3, player_marks)
        @player_array = []
        player_marks.each do |mark,comp|
            comp ? @player_array << ComputerPlayer.new(mark) : @player_array << HumanPlayer.new(mark)
        end
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
            user_input = @current_player.get_position(@board.legal_positions)
            @board.place_mark(user_input, @current_player.mark_value)
            victory = @board.check_victory(@current_player.mark_value)
            draw = !@board.empty_positions?
            game_over = victory || draw
            switch_turn if !game_over
        end
        @board.print
        if victory
            puts "Game Over! Player " + @current_player.mark_value.to_s + " wins!"
        else
            puts "Draw!"
        end
    end
end