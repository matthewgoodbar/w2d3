class Board

    def initialize(n=3)
        @n = n
        @board = Array.new(n) {Array.new(n, '_')}
    end

    def valid?(position)
        return false unless position.length == 2
        return false unless position[0] < @n && position[1] < @n
        return false unless position[0] >= 0 && position[1] >= 0
        return true
    end

    def empty?(position)
        return self[position] == '_'
    end

    def place_mark(position, mark)
        if valid?(position)
            if empty?(position)
                self[position] = mark
            else
                raise RuntimeError.new "Position not empty"
            end
        else
            raise RuntimeError.new "Invalid position"
        end
    end

    def [](position)
        return @board[position[0]][position[1]]
    end

    def []=(position, value)
        @board[position[0]][position[1]] = value
    end

    def print
        @board.each do |row|
            p row
            puts
        end
    end

    def win_row?(mark)
        @board.each{|row| return true if row.all? {|el| el == mark}}
        return false
    end

    def win_col?(mark)
        (0...@board[0].length).each do |j|
            col = []
            (0...@board.length).each {|i| col << @board[i][j]}
            return true if col.all? {|el| el == mark}
        end
        return false
    end

    def win_diag?(mark)
        diag = []
        off_diag = []
        (0...@board.length).each do |i|
            j = -1 - i
            diag << @board[i][i]
            off_diag << @board[i][j]
        end
        return true if diag.all? {|el| el == mark} || off_diag.all? {|el| el == mark}
        return false
    end

    def empty_positions?
        @board.each do |row|
            return true if row.any? {|el| el == '_'}
        end
        return false
    end

    def check_victory(mark)
        return true if win_row?(mark)
        return true if win_col?(mark)
        return true if win_diag?(mark)
        return false
    end

end