
local _class = {}

local classes = require("caress/classes")

local Hello = classes.Object.Entity.Hello

-- Game instances receive configuration from conf.lua
-- Child entities must not be created within an init()
function _class:init(CONFIG)
  
  -- Define layers, which become canvases that are merged together after all
  -- entities have been rendered. They are merged from lower to higher values.
  local layers = {
    default = 0
  }

  -- Game.lua creates a GraphicsDevice available at self.graphicsDevice and
  -- a input device at self.input
  self.super:init(CONFIG, layers)
end

function _class:main(coh)
  -- self:create() creates an entity, adds it as a child and starts it
  local hello = self:create(Hello, self.layers.default, coh)
  -- Wait for it to finish
  coh:event(hello, "finished"):wait()
  -- Destroy it, i.e. removes from child list and does some cleanup
  self:destroy(hello)
  -- We are done, close the application
  self:quit()
end

-- Child entities are drawn and updated by their parent without the need to
-- write an update() or draw()

return _class
