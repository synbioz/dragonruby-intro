class Bomb < Entity
  def initialize(x, y)
    super(x, y, 15, 15, :bomb)
  end

  def to_sprite
    self.rect << 'sprites/bomb.png'
  end
end
