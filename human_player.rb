require_relative('player')

class HumanPlayer < Player
    def initialize(color, display)
        super(color, display)
    end

    def make_move(_board)

    end
end


if $PROGRAM_NAME == __FILE__
end