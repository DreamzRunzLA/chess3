require_relative('piece')

class Board
    def initialize
        @board = Array.new(7) { Array.new(7) {''} }
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

    def self.move_piece(start_pos, end_pos)
        #comment
    end

end