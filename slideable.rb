require('byebug')

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
        all_moves = []
        self.move_dirs.each do |direction|
            dx = direction[0]
            dy = direction[1]
            all_moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end
        return all_moves
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        #Feed it an entry from either horizontal or diagonol dirs
        unblocked_moves = []

        new_x = self.position[0] + dx
        new_y = self.position[1] + dy
        while true
            if self.board.[]([new_x, new_y]).color == nil && new_x < 7 && new_y < 7 && new_x > 0 && new_y > 0
                unblocked_moves << [new_x, new_y]
                new_x += dx
                new_y += dy
            elsif self.board.[]([new_x, new_y]).color != self.color
                unblocked_moves << [new_x, new_y]
                return unblocked_moves
            else
                break
            end
        end

        return unblocked_moves
    end

    def move_dirs
        #overwritten by subclass
    end

    # private :move_dirs, :grow_unblocked_moves_in_dir
end