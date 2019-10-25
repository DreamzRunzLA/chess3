require_relative('stepable')
require_relative('piece')

class Knight < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "KN"
    end

    def move_diffs
        #Overwrite the Stepable method here
    end

end

class King < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "KI"
    end

    def move_diffs
        #Overwrite the Stepable method here
    end

end