require_relative('display')
require_relative('human_player')

class Game
    attr_reader :display, :board, :player1, :player2, :current_player

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(:white, @display)
        @player2 = HumanPlayer.new(:black, @display)
        @current_player = @player1
    end

    def play
        #Until @board.checkmate?
        #Loop through continuously and ask players to make moves
        #Make sure moves are valid
        #Use the swap turn method to constantly switch at the end of each turn
        #Read the position off of @cursor.get_input

        until @board.checkmate?(:white) || @board.checkmate?(:white)
            #use these for final tests
            # @board.move_piece(:white, [6,5], [5,5])
            # @board.move_piece(:black, [1,4], [3,4])
            # @board.move_piece(:white, [6,6], [4,6])
            # @board.move_piece(:black, [0,3], [4,7])
            
            puts "   #{(0...@board.rows.length).to_a.join('    ')}"
            @board.rows.each_with_index do |row, i|
                rendered = i.to_s + ' '
                row.each_with_index do |col, k|
                    if i == @display.cursor.cursor_pos[0] && k == @display.cursor.cursor_pos[1]
                        if @display.cursor.selected == true
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
            
            @current_player.make_move(@board)
            
            begin
                if @display.cursor.selected == true && @board.[](@display.cursor.cursor_pos).color == @current_player.color
                    p "Select destination"
                    sleep(1)
                    # #Second begin/rescue block to handle where the piece is being moved
                    begin
                        if @display.cursor.selected == false && @board.[](@display.cursor.cursor_pos).valid_moves.include?(@display.cursor.cursor_pos)
                            p "Selection is valid"
                            sleep(1)
                        elsif @display.cursor.selected == false && @board.[](@display.cursor.cursor_pos).valid_moves.include?(@display.cursor.cursor_pos) == false
                            raise ArgumentError.new("Can't move your piece there")
                        else

                        end
                    rescue ArgumentError => e
                        puts e.message
                        sleep(1)
                        @display.cursor.toggle_selected
                        retry
                    end
                elsif @display.cursor.selected == true && @board.[](@display.cursor.cursor_pos).color != @current_player.color
                    raise ArgumentError.new("Ya dun goofed, select one of your pieces")
                else

                end
            rescue ArgumentError => e
                puts e.message
                sleep(1)
                @display.cursor.toggle_selected
                retry
            end
        end
    end

    def notify_players

    end

    def swap_turn!
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end
end



if $PROGRAM_NAME == __FILE__
    my_game = Game.new
    my_game.play
end

#Old tests
# p my_game.player1
# p my_game.player2
# p my_game.current_player
# my_game.swap_turn!
# p "swapped!"
# p my_game.current_player
# my_game.swap_turn!
# p "swapped again!"
# p my_game.current_player