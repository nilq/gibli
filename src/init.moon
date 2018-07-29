export state = {}


organism = require "src/organism"


state.load = =>
  @world = {}

  for i = 0, 200
    @spawn organism.agent.make 5


state.spawn = (a) =>
  @world[#@world + 1] = a


state.update = (dt) =>
  for element in *@world
    element\update dt if element.update

  table.sort @world, (a, b) -> a.scale < b.scale -- n sorting lol


state.draw = =>
  with love.graphics
    .push!
    .translate .getWidth! / 2, .getHeight! / 2

    for element in *@world
      element\draw! if element.draw

    .pop!


state