class ComputerPlayer

    attr_reader :mark_value

    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        computer_input = legal_positions.sample
        puts "Computer player " + @mark_value.to_s + " chose: " + computer_input[0].to_s + " " + computer_input[1].to_s
        return computer_input
    end
end