state = { }
local organism = require("src/organism")
state.load = function(self)
  self.world = { }
  for i = 0, 200 do
    self:spawn(organism.agent.make(5))
  end
end
state.spawn = function(self, a)
  self.world[#self.world + 1] = a
end
state.update = function(self, dt)
  local _list_0 = self.world
  for _index_0 = 1, #_list_0 do
    local element = _list_0[_index_0]
    if element.update then
      element:update(dt)
    end
  end
  return table.sort(self.world, function(a, b)
    return a.scale < b.scale
  end)
end
state.draw = function(self)
  do
    local _with_0 = love.graphics
    _with_0.push()
    _with_0.translate(_with_0.getWidth() / 2, _with_0.getHeight() / 2)
    local _list_0 = self.world
    for _index_0 = 1, #_list_0 do
      local element = _list_0[_index_0]
      if element.draw then
        element:draw()
      end
    end
    _with_0.pop()
    return _with_0
  end
end
return state
