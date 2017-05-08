require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board = nil)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    size = @board.grid.length
    size.times do |row|
      size.times do |column|
        print " #{@board[[row,column]]} "
      end
    end
  end

end
