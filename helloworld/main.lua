--- Main module.
--
-- As per love standards, this is the main file. This module contains
-- love callbacks and puts together modules, defining application
-- structure. Game structure is later defined at a Game subclass.
--
-- @module main

local CONFIG = _CONFIG

local Vector    = require("caress/Vector")
-- Remember that different strings on require result on new module instances
-- being returned, require("path/A") and require("other/path/A") return
-- different values, even if both paths point to the same module. This is
-- important here because the 'classes' variable will hold all loaded classes.
-- A different instance would have no classes, different classes or duplicate
-- them all.
local classes   = require("caress/classes")

-- Configure which error handling function you want to use
local error     = require("caress/error")
error.setErrHandFunction(love.errhand)

-- I tweak lua's garbage collector a bit for performance
if not CONFIG.game.gc then
  print("WARNING: Stopping garbage collector.")
  collectgarbage('stop')
end
collectgarbage('setpause', CONFIG.game.gcLimit)
collectgarbage('setstepmul', CONFIG.game.gcSpeed*100)

-- Global reference to game instance that every entity can use upon
-- initialization. It starts with an underscore to remember us that we
-- shouldn't be using it after saving it on a local variable for faster access.
_game = nil
local game

function love.load()
  -- Load caress's standard class library
  classes:loadClassesByDir("caress/classeslib")
  -- Load our project custom classes
  classes:loadClassesByDir("classes")
  -- Mandatory step, process loaded classes
  classes:finish()

  -- Get the game subclass
  local gameClasses = classes.Object.Entity.Game:getSubclasses()
  
  if gameClasses:is_empty() then
    error.errhand("No Game classes found.")
    return
  end
  
  if gameClasses:size() > 1 then
    error.errhand("More than one Game class found.")
    return
  end
  
  local GameClass = gameClasses:front()
  
  -- Create a game instance inplace so a reference for it is available before
  -- it's totally constructed, specially because it needs to exist during it's
  -- own init().
  _game = {}
  game = _game
  
  GameClass:newInplace(game, CONFIG)
  
  -- Start game logic, i.e. run it's main()
  game:start()
end

-- The rest of the file are the usual love bindings to our game instance

function love.update(dt)
  if game then
    game:update(dt)
  end
end

function love.draw()
  if game then
    game:draw()
  end
end

function love.keypressed(key, isRepeat)
  if game then
    game:keypressed(key, isRepeat)
  end
end

function love.keyreleased(key)
  if game then
    game:keyreleased(key)
  end
end

function love.gamepadpressed(joystick, button)
  if game then
    game:gamepadpressed(joystick, button)
  end
end

function love.gamepadreleased(joystick, button)
  if game then
    game:gamepadreleased(joystick, button)
  end
end
