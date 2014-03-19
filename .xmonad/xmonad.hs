-- imports 
import XMonad
import Control.Monad
import qualified XMonad.StackSet as W

-- definitions
myTerminal = "urxvt"
myModMask = mod4Mask

myWorkspaces = ["1consoles", "2qt", "3chat", "4web", "5email", "6media", "7other"]

myStartupHook = do
  spawn "~/.xmonad/startup.py"

myManageHook = composeAll . concat $ [
    [ className =? "urxvt" --> viewShift "1consoles" ],
    [ className =? "qtcreator" --> viewShift "2qt" ],
    [ className =? "hipchat" --> viewShift "3chat" ],
    [ className =? "google-chrome" --> viewShift "4web" ] -- ,
--    [ className =? "" --> viewShift "5email" ],
--    [ className =? "" --> viewShift "6media" ]
  ]
  where
    viewShift = doF . liftM2 (.) W.greedyView W.shift

main = do
  xmonad $ defaultConfig {
    modMask = myModMask,
    borderWidth = 2,

    terminal = myTerminal,
    workspaces = myWorkspaces,

    manageHook = myManageHook,
    startupHook = myStartupHook
  }

