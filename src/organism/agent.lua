local make
make = function(dimensions)
  local agent = {
    pos = (function()
      local _accum_0 = { }
      local _len_0 = 1
      for i = 1, dimensions do
        _accum_0[_len_0] = math.random(-200, 200)
        _len_0 = _len_0 + 1
      end
      return _accum_0
    end)(),
    scale = 1
  }
  agent.color = {
    .01 * math.random(0, 255),
    .01 * math.random(0, 255),
    .01 * math.random(0, 255)
  }
  agent.radius = 10
  agent.update = function(self, dt)
    local point, scale = projectn(2, 500, self.pos)
    for i = 1, #self.pos do
      self.pos[i] = self.pos[i] + (dt * math.random(-20, 20))
    end
    self.x = scale * point[1]
    self.y = scale * point[2]
    self.scale = scale
  end
  agent.draw = function(self)
    do
      local _with_0 = love.graphics
      _with_0.setColor(self.color)
      _with_0.circle("fill", self.x, self.y, self.radius * self.scale)
      return _with_0
    end
  end
  return agent
end
return {
  make = make
}
