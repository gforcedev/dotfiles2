import System.Exit
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce

import qualified XMonad.StackSet as W

myStartupHook = do
    spawnOnce "picom";

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = insertPosition Below Newer <+> manageDocks <+> (isDialog --> doF W.shiftMaster <+> doF W.swapDown) <+> manageHook defaultConfig
        , layoutHook = gaps [(U,35)] $ spacingWithEdge 10 $ avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "alacritty"
        , borderWidth = 0
        , startupHook = myStartupHook
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((mod4Mask, xK_Return), spawn "alacritty")
        , ((mod4Mask .|. shiftMask, xK_Return), windows W.swapMaster)
        , ((mod4Mask .|. shiftMask, xK_q), kill)
        , ((mod4Mask .|. shiftMask, xK_x), spawn "betterlockscreen -l")
        , ((mod4Mask .|. controlMask .|. shiftMask, xK_BackSpace), io (exitWith ExitSuccess))
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
