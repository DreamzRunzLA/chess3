require_relative 'display'

class Game
    attr_reader :game_display, :game_board

    def initialize
        @game_board = Board.new
        @game_display = Display.new(@game_board)
    end
end



if $PROGRAM_NAME == __FILE__
    my_game = Game.new
    my_game.game_display.render
end