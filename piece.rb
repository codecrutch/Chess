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
    diff = super
    if diff[0].abs == diff[1].abs
      true #diagonal move
    elsif diff[0] == 0
      true #horizontal move
    elsif diff[1] == 0
      true #vertical move
    else
      false
    end
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
    debugger
    diff = super
    diff[0].abs > 1 || diff[1].abs > 1 ? false : true
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
    diff = super
    if diff[0].abs == diff[1].abs
      true #diagonal move
    else
      false
    end
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
    diff = super

    if diff[0] == 0
      true #horizontal move
    elsif diff[1] == 0
      true #vertical move
    else
      false
    end
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
    diff = super

    if diff[0].abs == 2 && diff[1].abs == 1
      true
    elsif diff[0].abs == 1 && diff[1].abs == 2
      true
    else
      false
    end
  end

  def move_dirs
    [[-2, -1],[-2, 1],[-1, -2],[-1, 2],[ 1, -2],[ 1, 2],[2, -1],[2, 1]]
  end

  def to_s
    "♞".colorize(color)
  end
end

class Pawn < Piece

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
