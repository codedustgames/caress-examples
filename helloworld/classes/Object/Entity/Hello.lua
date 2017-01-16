
local _class = {}

local text

-- Locals for faster access
local game
local graphicsDevice

-- Entities have a parent, belong to a layer and receive a coroutine handler
-- so they can yield and give other entities a chance to update and draw.
function _class:init(parent, layer, coh)
  -- Entity.lua does not need a coroutine handler
  self.super("init", parent, layer)

  game = _game
  graphicsDevice = game.graphicsDevice
end

-- Caress coroutine that defines this entity's logic flow. It receives a
-- coroutine handler as parameter that serves to synchronize it's execution
-- with event or time conditions.
function _class:main(coh)
  local loopCount = 0
  while loopCount < 3 do
    text = "Hello,"
    -- Wait one second and update text
    coh:time(1.0):wait()
    text = "Hello, World!"
    coh:time(1.0):wait()
    loopCount = loopCount + 1
  end

  -- Notify that this entity finished. The parent will destroy it.
  self:emit("finished")
end

-- This entity is drawn to the correct layer passed to Entity:init() without
-- doing anything extra here
function _class:draw()
  local gd = graphicsDevice
  gd:rawPrintf(text, 30, 20, 999)
end

return _class
