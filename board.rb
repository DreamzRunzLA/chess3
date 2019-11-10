require_relative 'pieces'
require('byebug')

class Board
  attr_reader :rows

  def initialize(fill_board = true)
    @sentinel = NullPiece.instance
    make_starting_grid(fill_board)
  end

  def [](pos)
    raise 'invalid pos' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col]
  end

  def []=(pos, piece)
    raise 'invalid pos' unless valid_pos?(pos)

    row, col = pos
    @rows[row][col] = piece
  end

  def add_piece(piece, pos)
    raise 'position not empty' unless empty?(pos)

    self[pos] = piece
  end

  def checkmate?(color)
    #Check if in_check? is true AND none of your own pieces have any valid_moves
    your_pieces = pieces.reject do |piece|
      piece.color != color
    end

    no_moves = your_pieces.all? do |piece|
      piece.valid_moves == []
    end
    
    return self.in_check?(color) && no_moves
  end

  def dup
    new_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, new_board, piece.pos)
    end

    new_board
  end

  def empty?(pos)
    self[pos].empty?
  end

  def in_check?(color)
    #First find the position of the king on the board
    #Then check if any of the opponents pieces can move to that position
    your_pieces = pieces.reject do |piece|
      piece.color != color
    end

    their_pieces = pieces.reject do |piece|
      piece.color == color
    end

    king_pos = nil
    your_pieces.each do |piece|
      if piece.symbol == "KI"
        king_pos = piece.pos
      end
    end

    return their_pieces.any? do |piece|
      piece.moves.include?(king_pos)
    end

  end

  def move_piece(turn_color, start_pos, end_pos)
    raise 'start position is empty' if empty?(start_pos)

    piece = self[start_pos]
    if piece.color != turn_color
      raise 'You must move your own piece'
    elsif !piece.moves.include?(end_pos)
      raise 'Piece does not move like that'
    elsif !piece.valid_moves.include?(end_pos)
      raise 'You cannot move into check'
    end

    move_piece!(start_pos, end_pos)
  end

  # move without performing checks
  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise 'piece cannot move like that' unless piece.moves.include?(end_pos)

    self[end_pos] = piece
    self[start_pos] = sentinel
    piece.pos = end_pos

    nil
  end

  def pieces
    @rows.flatten.reject(&:empty?)
  end

  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  private

  attr_reader :sentinel

  def fill_back_row(color)
    back_pieces = [
      Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
    ]

    # back_pieces = [
    #   Knight, Knight, Knight, Knight, Knight, Knight, Knight, Knight
    # ]

    i = color == :white ? 7 : 0
    back_pieces.each_with_index do |piece_class, j|
      piece_class.new(color, self, [i, j])
    end
  end

  def fill_pawns_row(color)
    i = color == :white ? 6 : 1
    8.times { |j| Pawn.new(color, self, [i, j]) }
  end

  def make_starting_grid(fill_board)
    @rows = Array.new(8) { Array.new(8, sentinel) }
    return unless fill_board
    %i(white black).each do |color|
      fill_back_row(color)
      fill_pawns_row(color)
    end
  end

end

if $PROGRAM_NAME == __FILE__
    my_board = Board.new
    my_board.move_piece(:white, [6,5], [5,5])
    my_board.move_piece(:black, [1,4], [3,4])
    my_board.move_piece(:white, [6,6], [4,6])
    my_board.move_piece(:black, [0,3], [4,7])

    # all_pieces = my_board.pieces.length
    # your_pieces = my_board.pieces.reject do |piece|
    #   piece.color != :white
    # end
    # your_pieces.each do |piece|
    #   p piece.valid_moves.length
    # end

    # Phase 2 tests
    p my_board.in_check?(:white)
    p my_board.checkmate?(:white)
end

#Insta checkmate
#[6,5] to [5,5] or f2 to f3
#[1,4] to [3,4] or e7 to e5
#[6,6] to [4,6] or g2 to g4
#[0,3] to [4,7] or d8 to h4

#Old test
# p my_board.in_check?(:white)