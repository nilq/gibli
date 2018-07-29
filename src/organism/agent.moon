make = (dimensions) ->
  agent = {
    pos: [ math.random -200, 200 for i = 1, dimensions ]
    scale: 1
  }


  agent.color = {
    .01 * math.random 0, 255
    .01 * math.random 0, 255
    .01 * math.random 0, 255
  }

  agent.radius = 10


  agent.update = (dt) =>
    point, scale = projectn 2, 500, @pos

    for i = 1, #@pos
      @pos[i] += dt * math.random -20, 20
    
    @x = scale * point[1]
    @y = scale * point[2]

    @scale = scale


  agent.draw = =>
    with love.graphics
      .setColor @color
      .circle "fill", @x, @y, @radius * @scale


  agent

{
  :make
}