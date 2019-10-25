module Slideable

    def moves
        if self.move_dirs == 'hv'

        elsif self.move_dirs == 'd'

        elsif self.move_dirs == 'b'

        else
            raise 'move direction error'
        end
    end

end