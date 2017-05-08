require_relative 'piece'

class Board

  class InvalidMove < ArgumentError
  end


  attr_accessor :grid

  def initialize
    @grid = Array.new(8){ Array.new(8) }
    populate
  end

  def populate
    grid.each_index do |row|
      grid.each_index do |column|
        @grid[row][column] = Piece.new unless (2..5).include?(row)
        @grid[row][column] = NullPiece.new if (2..5).include?(row)
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise InvalidMove.new("No piece to move") if self[start_pos].is_a?(NullPiece)
    raise InvalidMove.new("Can't move there") unless self[start_pos].valid_move?()
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(*pos,value)
    x,y = pos
    @grid[x][y] = value
  end

  def in_bounds?(pos)
    x, y = pos
    return false if x is < 0 || x > grid.length
    return false if y is < 0 || y > grid.length

    true
  end

end


# first row: rook, knight, bishop, queen,
#            king, bishop, knight, and rook;
# second row: pawns
