require_relative 'display'
require_relative('human_player')

class Game
    attr_reader :display, :board, :player1, :player2, :current_player

    def initialize
        @board = Board.new
        @display = Display.new(@game_board)
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

            if @display.cursor.selected
                
            end
        end
        p "it's all over!"
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