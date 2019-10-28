require_relative('board')
require_relative('cursor')
require('colorize')

class Display
    @cursor = Cursor.new([0,0], board)
end