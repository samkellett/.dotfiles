-- imports 
import XMonad
import Control.Monad
import qualified XMonad.StackSet as W

import XMonad.Util.Run(spawnPipe)

-- definitions
myTerminal = "urxvt"

myStartupHook = do
  spawn "~/.xmonad/startup.py"

m4 = mod4Mask;
main = do
  xmonad $ defaultConfig {
    modMask = m4,
    borderWidth = 2,
    terminal = myTerminal,
    startupHook = myStartupHook
  }

