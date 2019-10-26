require_relative('piece')

#Black will always be top, white will always be bottom

class Pawn < Piece
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "PA"
    end

    def move_dirs

    end

    def at_start_row?
        if (self.color == :black && self.position[0] == 1) || (self.color == :white && self.position[0] == 6)
            return true
        else
            return false
        end
    end

    def forward_dir
        if self.color == :black
            return 1
        else
            return -1
        end
    end

    def forward_steps

    end

    def side_attacks
        potential_attacks = []
        attack1 = [self.position[0] + self.forward_dir, self.position[1] - 1]
        attack2 = [self.position[0] + self.forward_dir, self.position[1] + 1]
        if self.board.[](attack1).color != nil && self.board.[](attack1).color != self.color
            potential_attacks << attack1
        end
        if self.board.[](attack2).color != nil && self.board.[](attack2).color != self.color
            potential_attacks << attack2
        end
        return potential_attacks
    end

    #private :at_start_row?, :forward_dir, :forward_steps, :side_attacks
end