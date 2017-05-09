require_relative 'chessmoves'
require 'singleton'

class Piece
  def initialize(position, board)
    @position = position
    @board = board
  end

  def valid_move?()
  end

  def moves
  end

  def to_s
    "♖".colorize(:magenta)
  end
end

class Queen < Piece
  include SlidingPiece

  def move_dirs
    [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
  end

end

class King < Piece
  include SteppingPiece

  def move_dirs
    [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
  end

end

class Bishop < Piece
  include SlidingPiece

  def move_dirs
    [[1,1],[1,-1],[-1,1],[-1,-1]]
  end
end

class Rook < Piece
  include SlidingPiece

  def move_dirs
    [[0,1],[1,0],[0,-1],[-1,0]]
  end
end

class Knight < Piece
  include SteppingPiece

  def move_dirs
    [[-2, -1],[-2, 1],[-1, -2],[-1, 2],[ 1, -2],[ 1, 2],[2, -1],[2, 1]]
  end
end

class NullPiece
  include Singleton

  def to_s
    " "
  end
end
