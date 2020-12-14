class Player < Entity
  attr_reader :score, :hp

  def initialize(x, y)
    super(x, y, 32, 64, :player)
    @hp = 3
    @score = 0
    @score_by_star = 10
  end

  def update!(state)
    state.stars.each do |star|
      if self.rect.intersect_rect?(star.rect)
        @score += @score_by_star
        state.stars.delete(star)
      end
    end

    state.bombs.each do |bomb|
      if self.rect.intersect_rect?(bomb.rect)
        @hp -= 1
        state.bombs.delete(bomb)
      end
    end
  end

  def to_sprite
    self.rect << 'sprites/player.png'
  end

  def score_to_s
    "Score: #{@score}"
  end

  def hp_to_s
    "Hp: #{@hp}"
  end
end
