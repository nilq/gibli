state = require "src"

FOV = 1200

project = (fov, point) ->
  scale  = fov / (fov + point[#point])
  point2 = {}

  for coord in *point
    point2[#point2 + 1] = coord * scale

    if #point2 - (#point - 1) == 0
      return point2, scale

export projectn = (dimension, fov, point) ->
  point2, scale = project fov, point

  if dimension - #point2 == 0
    return point2, scale
  else
    projectn dimension, fov, point2


with love
  .graphics.setBackgroundColor 1, 1, 1

  .load   =      -> state\load!
  .update = (dt) -> state\update dt
  .draw   =      -> state\draw!