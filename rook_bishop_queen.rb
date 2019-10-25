require_relative('slideable')
require_relative('piece')

class Rook < Piece
    include Slideable

end

class Bishop < Piece
    include Slideable

end

class Queen < Piece
    include Slideable

end