class Bomb < Entity
  WIDTH = 43
  HEIGHT = 43

  def initialize(x, y)
    super(x, y, 43, 43, :bomb)
  end

  def to_sprite
    self.rect << 'sprites/bomb.png'
  end
end
