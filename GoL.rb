require 'byebug'
require 'io/console'
require 'colorize'
require_relative 'Renderer.rb'
require_relative 'Board.rb'


# $OPTIONS = {
#   debug: false,
#   future_render: false,
#   default_dim: 25
# }

class Game
  $dim = 25
  def initialize
    @process_options
    @board = Board.new($dim)
    @future_board = Board.new($dim)
    @renderer = Renderer.new($dim, @board)
  end

  def begin
    puts "round 1"
    while true
      @renderer.print_board
      input = $stdin.getch
      break if input == "q"
      @board.predict_future
      @board.advance_turn
    end
    puts "Aight, bye"
  end


end

