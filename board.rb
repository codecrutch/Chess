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
    pawns = [Pawn] * 16
    elite_top = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    elite_bottom = elite_top.dup
    grid.each_index do |row|
      grid.each_index do |column|
        if row == 0
          @grid[row][column] = elite_top.shift.new([row,column], self)
        elsif row == 7
          @grid[row][column] = elite_bottom.shift.new([row,column], self, :magenta)
        elsif row == 1
          @grid[row][column] = pawns.shift.new([row,column], self)
        elsif row == 6
          @grid[row][column] = pawns.shift.new([row,column], self, :magenta)
        end

        # @grid[row][column] = Knight.new([row,column],self) unless (2..5).include?(row)
        @grid[row][column] = NullPiece.instance if (2..5).include?(row)
      end
    end
  end

  def move_piece(start_pos, end_pos)
    raise InvalidMove.new("No piece to move") if self[start_pos].is_a?(NullPiece)
    raise InvalidMove.new("Can't move there. Not a valid move.") unless self[start_pos].valid_move?(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    self[start_pos].position = start_pos
    self[end_pos].position = end_pos
  end
# WE NEED TO FIX THESE METHODS FOR MOVE_PIECE
  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos,value)
    x,y = pos
    @grid[x][y] = value
  end

  def in_bounds?(x, y)
    return false if x < 0 || x > grid.length - 1
    return false if y < 0 || y > grid.length - 1

    true
  end

end


# first row: rook, knight, bishop, queen,
#            king, bishop, knight, and rook;
# second row: pawns
