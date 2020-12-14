require "app/body.rb"
require "app/entity.rb"
require "app/player.rb"
require "app/bomb.rb"
require "app/star.rb"

class Game
  WINDOW_WIDTH = 1280
  WINDOW_HEIGHT = 720

  INPUT_MAP = {
    up: :z,
    left: :q,
    right: :d,
    down: :s
  }

  def initialize
    @state_set_up = false
  end

  def tick(args)
    init_state(args) unless @state_set_up

    process_logic(args)
    draw(args)


    $gtk.exit if args.state.player.hp < 0
  end

  private

  def init_state(args)
    args.state.player = Player.new(620, 0)
    args.state.stars = []
    args.state.bombs = []
    @state_set_up = true
  end

  def process_logic(args)
    spawn_entites(args)
    handle_input(args)
    args.state.player.update!(args.state)
  end

  def spawn_entites(args)
    spawn_star(args) if args.state.stars.count < 10 && rand(75) == 1
    spawn_bomb(args) if rand(125) == 1
  end

  def draw(args)
    args.outputs.labels << [20, 700, args.state.player.score_to_s]
    args.outputs.labels << [20, 680, args.state.player.hp_to_s]
    args.outputs.sprites << args.state.player.to_sprite

    args.state.stars.each do |star|
      args.outputs.sprites << star.to_sprite
    end

    args.state.bombs.each do |bomb|
      args.outputs.sprites << bomb.to_sprite
    end
  end

  def handle_input(args)
    if args.inputs.keyboard.key_held.send(INPUT_MAP[:left])
      args.state.player.move(:left)
    end

    if args.inputs.keyboard.key_held.send(INPUT_MAP[:right])
      args.state.player.move(:right)
    end

    if args.inputs.keyboard.key_held.send(INPUT_MAP[:up])
      args.state.player.move(:up)
    end

    if args.inputs.keyboard.key_held.send(INPUT_MAP[:down])
      args.state.player.move(:down)
    end
  end

  def spawn_star(args)
    pos = random_pos
    args.state.stars << Star.new(pos[:x], pos[:y])
  end

  def spawn_bomb(args)
    pos = random_pos
    args.state.bombs << Bomb.new(pos[:x], pos[:y])
  end

  def random_pos
    # Avoid spawning outside the window
    x = rand(WINDOW_WIDTH - 15)
    y = rand(WINDOW_HEIGHT - 15)

    { x: x, y: y }
  end
end
