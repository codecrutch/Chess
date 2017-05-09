require_relative 'chessmoves'

class Piece
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
end

class King < Piece
  include SteppingPiece
end

class Bishop < Piece
  include SlidingPiece
end

class Rook < Piece
  include SlidingPiece
end

class Knight < Piece
  include SteppingPiece
end




class NullPiece < Piece
 #  @@instance = NullPiece.new
 #
 # def self.instance
 #   return @@instance
 # end
 #
 # def to_s
 #   " "
 # end
 #
 # private_class_method :new
 def to_s
   " "
 end
end
