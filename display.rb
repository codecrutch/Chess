require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  def initialize(board = nil)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    size = @board.grid.length
    size.times do |row|
      size.times do |column|
        dest = [row,column]
        if @cursor.cursor_pos == dest
          color = @cursor.selected ? :blue : :light_green
          print " #{@board[dest]} ".colorize(background: color)
        elsif row % 2 == 0 && column % 2 == 0
          print " #{@board[dest]} ".colorize(background: :light_white)
        elsif row % 2 == 1 && column % 2 != 0
          print " #{@board[dest]} ".colorize(background: :light_white)
        else
          print " #{@board[dest]} "
        end
      end
      puts
    end

  end

  def run
    while true
      # puts String.colors
      # sleep 100
      system "clear"
      self.render
      @cursor.get_input
    end
  end

end
