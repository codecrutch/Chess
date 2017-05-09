require_relative 'chessmoves'
require 'singleton'
require 'byebug'

class Piece
  attr_reader :color
  attr_accessor :position

  def initialize(position, board, color = :yellow)
    @position = position
    @board = board
    @color = color
  end

  def valid_move?(start_pos, end_pos)
    row_diff = start_pos[0] - end_pos[0]
    col_diff = start_pos[1] - end_pos[1]
    [row_diff, col_diff]
  end

  def moves
  end

  def to_s
    "♚".colorize(color)
  end
end

class Queen < Piece
  include SlidingPiece

  def valid_move?(start_pos, end_pos)
  end

  def move_dirs
    [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
  end

  def to_s
    "♛".colorize(color)
  end
end

class King < Piece
  include SteppingPiece

  def valid_move?(start_pos, end_pos)
  end

  def move_dirs
    [[0,1],[1,0],[0,-1],[-1,0],[1,1],[1,-1],[-1,1],[-1,-1]]
  end

  def to_s
    "♚".colorize(color)
  end
end

class Bishop < Piece
  include SlidingPiece

  def valid_move?(start_pos, end_pos)
  end


  def move_dirs
    [[1,1],[1,-1],[-1,1],[-1,-1]]
  end

  def to_s
    "♝".colorize(color)
  end
end

class Rook < Piece
  include SlidingPiece

  def valid_move?(start_pos, end_pos)
  end

  def move_dirs
    [[0,1],[1,0],[0,-1],[-1,0]]
  end

  def to_s
    "♜".colorize(color)
  end
end

class Knight < Piece
  include SteppingPiece

  def valid_move?(start_pos, end_pos)
  end

  def move_dirs
    [[-2, -1],[-2, 1],[-1, -2],[-1, 2],[ 1, -2],[ 1, 2],[2, -1],[2, 1]]
  end

  def to_s
    "♞".colorize(color)
  end
end

class Pawn < Piece

  def initialize(position, board, color = :yellow)
    super
    @first_move = true
  end

  def valid_move?(start_pos, end_pos)
  end

  def to_s
    "♟".colorize(color)
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def position
  end

  def position=(val)
  end

  def to_s
    " "
  end
end
