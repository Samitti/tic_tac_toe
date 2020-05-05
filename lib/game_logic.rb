require_relative '../lib/board.rb'

class GameLogic < Board
  def horizontal_check(player_sym)
    i = 0
    win = false
    while i < 3
      x = 0
      result = []
      while x < 3
        result << @board[i][x]
        x += 1
      end
      if result.all?(player_sym)
        win = true
        break
      end
      i += 1
    end
    win
  end

  def vertical_check(player_sym)
    i = 0
    win = false
    while i < 3
      x = 0
      result = []
      while x < 3
        result << @board[x][i]
        x += 1
      end
      if result.all?(player_sym)
        win = true
        break
      end
      i += 1
    end
    win
  end

  def diagonal_left_check(player_sym)
    i = 0
    win = false
    while i < 3
      x = 0
      result = []
      while x < 3
        result << @board[x][x]
        x += 1
      end
      if result.all?(player_sym)
        win = true
        break
      end
      i += 1
    end
    win
  end

  def diagonal_right_check(player_sym)
    i = 0
    win = false
    while i < 3
      x = 0
      y = 2
      result = []
      while x < 3
        result << @board[x][y]
        y -= 1
        x += 1
      end
      if result.all?(player_sym)
        win = true
        break
      end
      i += 1
    end
    win
  end

  def check_winner(current_player, current_sym)
    win = []
    win << true if horizontal_check(current_sym)
    win << true if vertical_check(current_sym)
    win << true if diagonal_left_check(current_sym)
    win << true if diagonal_right_check(current_sym)
    if win.any?(true)
      puts "#{current_player} Wins!"
      true
    else
      false
    end
  end
end
