function love.conf(CONFIG)
  _CONFIG = CONFIG

  CONFIG.identity = "caress_helloworld"
  CONFIG.version = "0.9.2"
  CONFIG.console = false

  CONFIG.window.title = "Caress Hello World"
  CONFIG.window.icon = nil
  CONFIG.window.width = 1280
  CONFIG.window.height = 720
  CONFIG.window.borderless = false
  CONFIG.window.resizable = false
  CONFIG.window.minwidth = 1
  CONFIG.window.minheight = 1
  CONFIG.window.fullscreen = false
  CONFIG.window.fullscreentype = "desktop"
  CONFIG.window.vsync = true
  CONFIG.window.fsaa = 0
  CONFIG.window.display = 0

  CONFIG.modules.audio = true
  CONFIG.modules.event = true
  CONFIG.modules.graphics = true
  CONFIG.modules.image = true
  CONFIG.modules.joystick = true
  CONFIG.modules.keyboard = true
  CONFIG.modules.math = true
  CONFIG.modules.mouse = true
  CONFIG.modules.physics = false
  CONFIG.modules.sound = true
  CONFIG.modules.system = true
  CONFIG.modules.timer = true
  CONFIG.modules.window = true

  CONFIG.game = {}

  CONFIG.game.debug = false
  CONFIG.game.lovebird = false
  CONFIG.game.tileSize = 36
  CONFIG.game.baseCanvasWidth = 480
  CONFIG.game.baseCanvasHeight = 360
  CONFIG.game.screenHeightInTiles = 10.0
  -- The adequate or, sufficient, value here depends on collision detection
  -- and reaction code. Usually 2 is good enough.
  CONFIG.game.collisionIterations = 2
  CONFIG.game.updateTimeStepSize = 1.0/60
  CONFIG.game.gc = true
  CONFIG.game.gcLimit = 110
  CONFIG.game.gcSpeed = 10.0
  CONFIG.game.pg = false
  CONFIG.game.pgDisplay = false
  CONFIG.game.pgSmooth = false
  CONFIG.game.levelSize = 20
  CONFIG.game.useGamepad = false

  local key = {}

  key.up      = "up"
  key.down    = "down"
  key.left    = "left"
  key.right   = "right"
  key.a     = "z"
  key.b     = "x"
  key.c     = "c"
  key.d     = "v"
  key.pause   = "escape"
  key.menu    = "return"
  key.profiling = "f12"

  local joy = {}

  joy.up      = "dpup"
  joy.down    = "dpdown"
  joy.left    = "dpleft"
  joy.right   = "dpright"
  joy.a     = "a"
  joy.b     = "x"
  joy.c     = "b"
  joy.d     = "y"
  joy.pause   = "start"
  joy.menu    = "back"
  joy.profiling = "rightstick"

  CONFIG.game.inputMapping = {
    keyboard = key,
    gamepad = joy,
  }
end
