class Piece

  # def initialize(type)
  #   @type = type
  # end
  #
  # def symbol
  #   @type.to_sym
  # end
  #
  #
  def valid_move?()
  end

  def inspect
    :P
  end


  def to_s
    :P
  end

end

class NullPiece < Piece

end
