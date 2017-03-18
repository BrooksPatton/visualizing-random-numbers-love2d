Circle = require('circle')

function love.load()
  circles = {}
  local loc = {x = love.math.random(0, 800), y = love.math.random(0, 600)}
  local size = love.math.random(3, 15)
  table.insert(circles, Circle.new(loc, size))
end

function love.draw()
  for i,v in ipairs(circles) do
    v:draw()
  end
end

function love.update(dt)
  for i,v in ipairs(circles) do
    v:move()
    v:cleanTail()
  end

  local loc = {x = love.math.random(0, 800), y = love.math.random(0, 600)}
  local size = love.math.random(3, 15)
  table.insert(circles, Circle.new(loc, size))
end
