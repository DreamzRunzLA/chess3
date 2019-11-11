require_relative 'display'

class Game
    attr_reader :game_display, :game_board

    def initialize
        @board = Board.new
        @display = Display.new(@game_board)
        @player1 = HumanPlayer.new
        @player2 = HumanPlayer.new
        @current_player = @player1
    end

    def play

    end

    def notify_players

    end

    def swap_turn!
        if @current_player == player1
            @current_player = player2
        else
            @current_player = player1
        end
    end
end



if $PROGRAM_NAME == __FILE__
    my_game = Game.new
    my_game.game_display.render
end