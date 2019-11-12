require_relative('player')
require_relative('game')

class HumanPlayer < Player
    def initialize(color, display)
        super(color, display)
    end

    def make_move(_board)
        #check if the piece you selected is in your pieces
        #if not print a message
        #check if the position you are moving to is a valid move location
        #if not, print a message and retry the begin block
        
    end

end
    #Command line implementation of make move method
    # def make_move(_board)
    #     begin
    #         puts "enter row number "
    #         row_num = gets.chomp
    #         if [0, 1, 2, 3, 4, 5, 6, 7].include?(row_num.to_i) == false
    #             raise ArgumentError.new("Invalid Row #")
    #         end
    #     rescue ArgumentError => e
    #         puts e.message
    #         retry
    #     end

    #     begin
    #         puts "enter col number "
    #         col_num = gets.chomp
    #         if [0, 1, 2, 3, 4, 5, 6, 7].include?(col_num.to_i) == false
    #             raise ArgumentError.new("Invalid Col #")
    #         end
    #     rescue ArgumentError => e
    #         puts e.message
    #         retry
    #     end

    #     return [row_num.to_i, col_num.to_i]
    # end

if $PROGRAM_NAME == __FILE__
    my_board = Board.new
    my_display = Display.new(my_board)
    my_human_player = HumanPlayer.new(:white, my_display)
    p my_human_player.make_move(my_board)
end