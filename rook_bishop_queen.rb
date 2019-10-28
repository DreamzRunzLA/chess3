require_relative('slideable')
require_relative('piece')

class Rook < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "RO"
    end

    def move_dirs
        return horizontal_dirs
    end

end

class Bishop < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "BI"
    end

    def move_dirs
        return diagonol_dirs
    end

end

class Queen < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "QU"
    end

    def move_dirs
        return horizontal_and_vertical_dirs + diagonal_dirs
    end

end