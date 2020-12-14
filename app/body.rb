class Body
  attr_reader :x, :y, :w, :h, :type

  def initialize(x, y, w, h, type)
    @x = x
    @y = y
    @w = w
    @h = h
    @type = type
  end

  def rect
    [@x, @y, @w, @h]
  end
end
