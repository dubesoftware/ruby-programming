class Canvas
  attr_accessor :width, :height, :color

  def initialize
    @width = 100
    @height = 100
    @color = :black
  end

  def draw_rect(x, y, width, height)
    # draws a rectangle
  end

  def to_s
    "#{@width}x#{@height} #{@color} canvas"
  end
end

puts "Override defaults by assigning new values the traditional way:"
canvas = Canvas.new
canvas.width = 250
canvas.height = 500
canvas.color = :blue
puts canvas