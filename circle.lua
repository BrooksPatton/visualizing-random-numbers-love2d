local Circle = {}
Circle.__index = Circle

function Circle.new(loc, radius)
  local circle = {}
  setmetatable(circle, Circle)

  circle.x = loc.x
  circle.y = loc.y
  circle.radius = radius
  circle.tail = {}
  -- circle.color = {love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255), 5}
  circle.color = {255, 255, 255, 5}

  return circle
end

function Circle:draw()
  love.graphics.setColor(self.color)
  love.graphics.circle('fill', self.x, self.y, self.radius)

  -- local distance = 0
  -- local fade = 0
  -- local radius = self.radius * 0.90
  -- for i=#self.tail, 1, -1 do
  --   love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.color[4] - fade)
  --   love.graphics.circle('fill', self.x - distance, self.tail[i], radius, 3)
  --   distance = distance + 1
  --   fade = fade + 3
  -- end
end

function Circle:move(y)
  table.insert(self.tail, self.y)
  local rand = love.math.random(-1, 1)

  self.y = self.y + rand
end

function Circle:cleanTail()
  if #self.tail >= 85 then
    table.remove(self.tail, 1)
  end
end

return Circle
