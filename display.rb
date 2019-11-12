require_relative('board')
require_relative('cursor')
require('colorize')

class Display
    #render the square at cursor_pos in a different color

    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        while true 
            # system('clear')
            puts "   #{(0...@board.rows.length).to_a.join('    ')}"
            @board.rows.each_with_index do |row, i|
                rendered = i.to_s + ' '
                row.each_with_index do |col, k|
                    if i == @cursor.cursor_pos[0] && k == @cursor.cursor_pos[1]
                        if @cursor.selected == true
                            rendered += col.to_s.colorize({:background => :red }) + ' '
                        else
                            rendered += col.to_s.colorize({:background => :blue }) + ' '
                        end
                    else
                        rendered += col.to_s + ' '
                    end
                end
                puts rendered
            end
            x = @cursor.get_input
            p x
        end
    end
    
end

if $PROGRAM_NAME == __FILE__
    my_board = Board.new
    # my_board.move_piece(:white, [6,5], [5,5])
    # my_board.move_piece(:black, [1,4], [3,4])
    # my_board.move_piece(:white, [6,6], [4,6])
    # my_board.move_piece(:black, [0,3], [4,7])
    my_display = Display.new(my_board)
    my_display.render
end

#Insta checkmate
#[6,5] to [5,5] or f2 to f3
#[1,4] to [3,4] or e7 to e5
#[6,6] to [4,6] or g2 to g4
#[0,3] to [4,7] or d8 to h4