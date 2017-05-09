module SlidingPiece
  def moves
    moves = []

    move_dirs.each do |row, column|
      curr_row = position[0]
      curr_column = position[1]
      until @board.in_bounds?(curr_row, curr_column) == false
        move_row = curr_row + row
        move_column = curr_column + column
        move = [move_row, move_column]
        # p move
        # sleep 100
        unless @board[move].is_a?(NullPiece)
          if @board[move].color != @color
            moves << move
          end
        end
        moves << move
        curr_row, curr_column = move_row, move_column
      end
    end
    moves
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
