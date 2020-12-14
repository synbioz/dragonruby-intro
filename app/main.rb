require "app/game.rb"

def tick(args)
  args.state.game ||= Game.new
  args.state.game.tick(args)
end
