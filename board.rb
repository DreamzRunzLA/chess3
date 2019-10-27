require_relative('nullpiece')
require_relative('pawn')
require_relative('knight_king')
require_relative('rook_bishop_queen')

class Board
    attr_reader :board

    def initialize
        @board = Array.new(8) { Array.new(8) {''} }
        setup
    end

    def setup
        @board.each_with_index do |row, i|
            row.each_with_index do |col, k|
                if i == 4 || i == 5 || i == 2 || i == 3
                    @board[i][k] = NullPiece.instance
                elsif i == 0
                    @board[i][0] = Rook.new(:black, self, [i, 0])
                    @board[i][7] = Rook.new(:black, self, [i, 7])
                    @board[i][1] = Knight.new(:black, self, [i, 1])
                    @board[i][6] = Knight.new(:black, self, [i, 6])
                    @board[i][2] = Bishop.new(:black, self, [i, 2])
                    @board[i][5] = Bishop.new(:black, self, [i, 5])
                    @board[i][3] = Queen.new(:black, self, [i,3])
                    @board[i][4] = King.new(:black, self, [i,4])
                elsif i == 1
                    @board[i][k] = Pawn.new(:black, self, [i, k])
                elsif i == 6
                    @board[i][k] = Pawn.new(:white, self, [i, k])
                elsif i == 7
                    @board[i][0] = Rook.new(:white, self, [i, 0])
                    @board[i][7] = Rook.new(:white, self, [i, 7])
                    @board[i][1] = Knight.new(:white, self, [i, 1])
                    @board[i][6] = Knight.new(:white, self, [i, 6])
                    @board[i][2] = Bishop.new(:white, self, [i, 2])
                    @board[i][5] = Bishop.new(:white, self, [i, 5])
                    @board[i][3] = Queen.new(:white, self, [i,3])
                    @board[i][4] = King.new(:white, self, [i,4])
                end
            end
        end
    end

    def [](pos)
        @board[pos[0]][pos[1]]
    end
    
    def []=(pos, val)
        @board[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        if self.board[start_pos[0]][start_pos[1]] == nil
            raise "no piece at start_pos!"
        elsif self.board[end_pos[0]][end_pos[1]] != nil
            raise "cannot move piece to end_pos!"
        else
            temp = self.board[start_pos[0]][start_pos[1]]
            self.board[start_pos[0]][start_pos[1]] = nil
            self.board[end_pos[0]][end_pos[1]] = temp
        end
    end

    def valid_pos?(pos)
        pos.all? { |coord| coord.between?(0, 7) }
    end

    def empty?(pos)
        self.position.empty?
    end

    def render
        system('clear')
        puts "   #{(0...@board.length).to_a.join('  ')}"
        @board.each_with_index do |row, i|
            rendered = i.to_s + ' '
            row.each_with_index do |col, k|
                rendered += col.to_s + ' '
            end
            puts rendered
        end
        return ''
    end

end

if $PROGRAM_NAME == __FILE__
    my_board = Board.new
    my_board.render
    p my_board.[]([7,3]).valid_moves
end

# Tests
# p1 = Pawn.new(:black, myBoard, [4,1])
# p2 = Pawn.new(:black, myBoard, [4,3])
# pmain = Pawn.new(:white, myBoard, [5,2])
# myBoard.[]=([4,1], p1)
# myBoard.[]=([4,3], p2)
# myBoard.[]=([5,2], pmain)
# p pmain.side_attacks

# More Tests
# myBoard = Board.new
# black1 = Pawn.new(:black, myBoard, [5,2])
# black2 = Pawn.new(:black, myBoard, [5,4])
# pawny = Pawn.new(:white, myBoard, [6,3])
# myBoard.[]=([5,2], black1)
# myBoard.[]=([5,4], black2)
# myBoard.[]=([6,3], pawny)
# p pawny.move_dirs