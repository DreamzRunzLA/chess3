require_relative('slideable')
require_relative('piece')

class Rook < Piece
    include Slideable

    def move_dirs
        return 'hv'
    end

end

class Bishop < Piece
    include Slideable

    def move_dirs
        return 'd'
    end

end

class Queen < Piece
    include Slideable

    def move_dirs
        return 'b'
    end

end