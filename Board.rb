
class Board


  def initialize(dim)
    @dim = dim
    @board = {}
    @future_board = {}
    each_cell_address do |y_adr, x_adr|
      address = true_address(y_adr, x_adr)
      @board[address] = Cell.new
      @future_board[address] = Cell.new
    end
  end

  def get_cell(y_adr, x_adr, future = false)
    if future
      @future_board[true_address(y_adr, x_adr)]
    else
      @board[true_address(y_adr, x_adr)]
    end
  end

  def true_address(y, x)
    y.to_s + x.to_s
  end

  def each_cell_address(&callback)
    $dim.times do |y_adr|
      $dim.times do |x_adr|
        callback.call(y_adr, x_adr)
      end
    end
  end

  def count_living_neighbors(y_adr, x_adr)
    living_neighbors = 0
      (y_adr-1.. y_adr + 1).each do |y|
        (x_adr-1.. x_adr + 1).each do |x|
          # debugger
          next if y == y_adr && x == x_adr
          next if y < 0 || x < 0 || y > 24 || x > 24
          living_neighbors += 1 if @board[true_address(y,x)].alive?
        end
      end
      living_neighbors
  end

  def predict_future
    each_cell_address do |y_adr, x_adr|
      cell = get_cell(y_adr,x_adr)
      living_neighbors = count_living_neighbors(y_adr, x_adr)
      if (cell.alive? && living_neighbors == 2) || (living_neighbors == 3)

        @future_board[true_address(y_adr,x_adr)].vitalize
      else
        @future_board[true_address(y_adr,x_adr)].kill
      end

    end
  end

  def advance_turn
    @board = @future_board
  end

end

class Cell
  $seed = 10

  def initialize
    @alive = rand(100) <= $seed
  end

  def alive?
    @alive
  end

  def kill
    @alive = false
  end

  def vitalize
    @alive = true
  end

end