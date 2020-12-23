class Star < Entity
  WIDTH = 34
  HEIGHT = 33

  def initialize(x, y)
    super(x, y, WIDTH, HEIGHT, :star)
  end

  def to_sprite
    self.rect << 'sprites/star.png'
  end
end
