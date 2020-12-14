class Entity < Body
  def initialize(x, y, w, h, type)
    super(x, y, w, h, type)
    @speed = 7
  end

  def move(direction)
    case direction
    when :up
      @y += @speed
    when :down
      @y -= @speed
    when :right
      @x += @speed
    else
      @x -= @speed
    end
  end
end
