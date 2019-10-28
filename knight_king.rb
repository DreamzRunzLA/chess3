require_relative('stepable')
require_relative('piece')

class Knight < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "KN"
    end

    def move_diffs
        return [[2,1],[1,2],[-2,1],[1,-2],[2,-1],[-1,2],[-2,-1],[-1,-2]]
    end

end

class King < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, pos)
        super(color, board, pos)
        @symbol = "KI"
    end

    def move_diffs
        return [[1,0],[1,1],[0,1],[-1,1],[0,-1],[-1,-1],[-1,0],[1,-1]]
    end

end