require_relative('slideable')
require_relative('piece')

class Rook < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "RO"
    end

    def move_dirs
        return horizontal_dirs
    end

end

class Bishop < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "BI"
    end

    def move_dirs
        return diagonol_dirs
    end

end

class Queen < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "QU"
    end

    def move_dirs
        return horizontal_dirs.concat(diagonol_dirs)
    end

end