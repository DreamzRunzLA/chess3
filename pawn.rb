require_relative('piece')

class Pawn < Piece
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "PA"
    end

    def move_dirs

    end

    def at_start_row?

    end

    def forward_dir
        if self.color == 'black'
            return -1
        else
            return 1
        end
    end

    def forward_steps

    end

    def side_attacks
    
    end

    private :at_start_row?, :forward_dir, :forward_steps, :side_attacks
end