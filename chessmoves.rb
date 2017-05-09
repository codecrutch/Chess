module SlidingPiece
  def moves
    move_dirs
  end

  def move_dirs
    moves = []
  end
end

module SteppingPiece

  def moves
    moves = []

    move_dirs.each do |row, column|
      move_row = position[0] + row
      move_column = position[1] + column
      move = [move_row, move_column]
      if @board.in_bounds?(move_row, move_column)
        unless @board[move].is_a?(NullPiece)
          if @board[move].color != self.color
            moves << move
          end
        else
          moves << move
        end
      end
    end
    moves
  end
end
