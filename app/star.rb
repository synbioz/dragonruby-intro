class Star < Entity
  def initialize(x, y)
    super(x, y, 15, 15, :star)
  end

  def to_sprite
    self.rect << 'sprites/star.png'
  end
end
