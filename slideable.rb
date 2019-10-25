module Slideable
    HORIZONTAL_DIRS = [[0,1],[0,-1],[1,0],[-1,0]]
    DIAGONOL_DIRS = [[1,1],[1,-1],[-1,-1],[-1,1]]
    BOTH_DIRS = [[0,1],[0,-1],[1,0],[-1,0],[1,1],[1,-1],[-1,-1],[-1,1]]

    def moves
        if self.move_dirs == 'hv'

        elsif self.move_dirs == 'd'

        elsif self.move_dirs == 'b'

        else
            raise 'move direction error'
        end
    end

    def move_dirs
    end

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonol_dirs
        DIAGONOL_DIRS
    end

    def both_dirs
        BOTH_DIRS
    end

end