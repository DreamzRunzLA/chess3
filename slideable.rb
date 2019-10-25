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

    end

    def grow_unblocked_moves_in_dir(dx, dy)
        
    end

    def move_dirs
        #overwritten by subclass
    end

    private :move_dirs, :grow_unblocked_moves_in_dir
end