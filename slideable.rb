module Slideable
    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONOL_DIRS = [[1,1],[1,-1],[-1,-1],[-1,1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonol_dirs
        DIAGONOL_DIRS
    end

    def moves
        self.move_dirs.each do |direction|
            dx = direction[0]
            dy = direction[1]
        end
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        #Feed it an entry from either horizontal or diagonol dirs
        unblocked_moves = []
        new_x = self.position[0] + dx
        new_y = self.position[1] + dy
        if self.board.[]([new_x, new_y]) == nil && new_x < 8 && new_y < 8
            unblocked_moves << [new_x, new_y]
            new_x += dx
            new_y += dy
        elsif self.board.[]([new_x, new_y]).color != self.color
            unblocked_moves << [new_x, new_y]
            return unblocked_moves
        end

        return unblocked_moves
    end

    def move_dirs
        #overwritten by subclass
    end

    # private :move_dirs, :grow_unblocked_moves_in_dir
end