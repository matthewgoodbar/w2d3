class HumanPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position
        begin
            puts @mark_value.to_s + " player, enter a position:"
            user_input = gets.chomp.split(" ")
            user_input.map!(&:to_i)
            if user_input.length != 2 || (!user_input[0].is_a?(Integer) && !user_input[1].is_a?(Integer))
                raise RuntimeError.new "Invalid Input"
            end
        rescue
            puts "Invalid input! Please enter two integers, separated by a space."
            retry
        end
        return user_input
    end

end