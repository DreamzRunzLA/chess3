require_relative 'display'

class Game
    attr_reader :game_display

    def initialize(display)
        @game_display = display
    end
end

if $PROGRAM_NAME == __FILE__
    my_board = Board.new
    my_display = Display.new(my_board)
    my_game = Game.new(my_display)
    my_game.game_display.render
end