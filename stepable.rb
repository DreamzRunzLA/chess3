module Stepable
    def moves
        all_moves = []
        self.move_diffs.each do |diff|
            new_x = self.position[0] + diff[0]
            new_y = self.position[1] + diff[1]
            if self.board.[]([new_x, new_y]).color != self.color && new_x < 7 && new_y < 7 && new_x > 0 && new_y > 0
                all_moves << [new_x, new_y]
            end
        end
        return all_moves
    end

    def move_diffs
    end

    private :move_diffs
end