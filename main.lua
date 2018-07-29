local state = require("src")
local FOV = 1200
local project
project = function(fov, point)
  local scale = fov / (fov + point[#point])
  local point2 = { }
  for _index_0 = 1, #point do
    local coord = point[_index_0]
    point2[#point2 + 1] = coord * scale
    if #point2 - (#point - 1) == 0 then
      return point2, scale
    end
  end
end
projectn = function(dimension, fov, point)
  local point2, scale = project(fov, point)
  if dimension - #point2 == 0 then
    return point2, scale
  else
    return projectn(dimension, fov, point2)
  end
end
do
  local _with_0 = love
  _with_0.graphics.setBackgroundColor(1, 1, 1)
  _with_0.load = function()
    return state:load()
  end
  _with_0.update = function(dt)
    return state:update(dt)
  end
  _with_0.draw = function()
    return state:draw()
  end
  return _with_0
end
