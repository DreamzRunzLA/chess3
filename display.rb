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
                        rendered += col.to_s.colorize({:background => :blue }) + ' '
                    else
                        rendered += col.to_s + ' '
                    end
                end
                puts rendered
            end
            @cursor.get_input
            # system('clear')
        end
    end
    
end

if $PROGRAM_NAME == __FILE__
    my_board = Board.new
    my_display = Display.new(my_board)
    my_display.render
end