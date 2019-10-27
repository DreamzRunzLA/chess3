require_relative('piece')

#Black will always be top, white will always be bottom

class Pawn < Piece
    attr_reader :symbol

    def initialize(color, board, position)
        super(color, board, position)
        @symbol = "PA"
    end

    def move_dirs
        all_moves = []
        all_moves.concat(self.forward_steps)
        all_moves.concat(self.side_attacks)
        return all_moves
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
        steps = []
        
        #Check just forward block
        if self.board.[]([self.position[0] + self.forward_dir, self.position[1]]).color == nil
            steps << [self.position[0] + self.forward_dir, self.position[1]]
        end
        
        #Check if in home row and 2 blocks ahead is clear
        if self.board.[]([self.position[0] + self.forward_dir + self.forward_dir, self.position[1]]).color == nil && self.at_start_row?
            steps << [self.position[0] + self.forward_dir + self.forward_dir, self.position[1]]
        end

        return steps
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