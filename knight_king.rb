require_relative('stepable')
require_relative('piece')

class Knight < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "KN"
    end

end

class King < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "KI"
    end

end