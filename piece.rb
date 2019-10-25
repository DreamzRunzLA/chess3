require_relative('board')

class Piece
    attr_reader :color, :position

    def initialize(color, board, position)
        @color = color #type here is symbol
        @board = board
        @position = position #type here is array
    end

    def to_s
        if self.symbol != nil
            return self.symbol
        else
            return 'nil'
        end
    end

    def empty?
    end

    def valid_moves
    end

    def pos=(val)
    end

    def symbol
    end

    def move_into_check?(end_pos)
    end

    private :move_into_check?
end