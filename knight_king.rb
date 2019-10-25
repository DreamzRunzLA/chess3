require_relative('stepable')
require_relative('piece')

class Knight < Piece
    include Stepable

end

class King < Piece
    include Stepable

end