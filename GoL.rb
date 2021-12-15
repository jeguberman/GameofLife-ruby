require 'byebug'
require 'io/console'
require 'colorize'
require 'benchmark'
require 'pry'

require_relative 'Renderer.rb'
require_relative 'Board.rb'


# $OPTIONS = {
#   debug: false,
#   future_render: false,
#   default_dim: 25
# }

class Game
  $default_dim = 25
  def initialize
    dim = ARGV[0] == Integer ? ARGV[0] : $default_dim
    @process_options
    @board = Board.new(dim)
    @future_board = Board.new(dim)
    @renderer = Renderer.new(dim, @board)
  end



  def begin
    start = Time.new
    finish = Time.new
    speeds = []
    # while true
    20.times do
      start = Time.now
      # render_thread = Thread.new do 
        @renderer.print_board
      # end
      # board_thread = Thread.new do 
        @board.predict_future

      # end
      # render_thread.join
      # board_thread.join
      @board.advance_turn 
      
      # input = $stdin.getch
      # break if input == "q"

      
      
      finish = Time.now
      speeds << (start - finish)
    end
    puts "Report"
    speeds.each do |entry|
      puts entry.to_s 
    end
    puts "#{speeds.inject(:+)/speeds.length}"
  end


end

pry

Game.new.begin