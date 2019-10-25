require_relative('piece')

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) {''} }
        setup
    end

    def setup
        @board.each_with_index do |row, i|
            row.each_with_index do |col, k|
                if i == 0 || i == 1 || i == 6 || i == 7
                    @board[i][k] = Piece.new
                else
                    @board[i][k] = nil
                end
            end
        end
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end
    
    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        if self.board[start_pos[0]][start_pos[1]] == nil
            raise "no piece at start_pos!"
        elsif self.board[end_pos[0]][end_pos[1]] != nil
            raise "cannot move piece to end_pos!"
        else
            temp = self.board[start_pos[0]][start_pos[1]]
            self.board[start_pos[0]][start_pos[1]] = nil
            self.board[end_pos[0]][end_pos[1]] = temp
        end
    end

end