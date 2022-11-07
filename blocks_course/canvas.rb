require_relative 'utilities'

class Canvas
  attr_accessor :width, :height, :color

  def initialize
    @width = 100
    @height = 100
    @color = :black
    yield(self) if block_given?
  end

  def draw_rect(x, y, width, height)
    # draws a rectangle
  end

  def to_s
    "#{@width}x#{@height} #{@color} canvas"
  end
end

separator = Utilities::separator

puts "Override defaults by assigning new values the traditional way:"
canvas = Canvas.new
canvas.width = 250
canvas.height = 500
canvas.color = :blue
puts canvas
puts separator

puts "Initialize a new canvas using a block:"
canvas = Canvas.new do |c|
  c.width = 800
  c.height = 600
  c.color = :green
end
puts canvas
puts separator