class Renderer

  def initialize(dim, board)
    @board = board
    @horizontal_dim = dim
  end



  def print_board
    print render_board_top
    print new_line
    @board.each_cell_address do |y_adr, x_adr|
      
      print render_row_start(y_adr) if x_adr == 0
      print render_cell @board.get_cell(y_adr, x_adr) if true
      print render_address(y_adr, x_adr) if false
      print render_cell_with_future(y_adr, x_adr) if false
      print new_line if x_adr == 24
    end
    
    puts ""
  end

  def render_address(y_adr, x_adr)
    "#{y_adr.to_s.rjust(2)},#{x_adr.to_s.rjust(2)}"
  end

  def render_board_top
    local_buffer = ["  |"]
    (1.. 25).each do |i|
      local_buffer << i.to_s.rjust(2) + "|"
    end
    local_buffer.join
  end

  def new_line
    "\r\n" 
  end

  def render_row_start(y_adr)
    "#{y_adr.to_s.rjust(2)}|"
  end

  def render_cell(cell)
    @living = 0
    if cell.alive?
      return " * "
      @living +=1
    else
      return "   "
    end

  end

  def render_cell_with_future(y,x)
    cell = @board.get_cell(y, x) 
    future_cell = @board.get_cell(y,x)

    buffer = ""
    if cell.alive?
      buffer << "*"
    else
      buffer << "'"
    end

    if future_cell.alive?
      buffer << ".|"
    else
      buffer << ",|"
    end

  end

end