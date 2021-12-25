import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import System.Exit

myStartupHook = do
    spawnOnce "picom"
main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = gaps [(U,35)] $ spacingWithEdge 10 $ avoidStruts  $  layoutHook defaultConfig
        , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "st"
        , borderWidth = 0
        , startupHook = myStartupHook
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock; xset dpms force off")
        , ((mod4Mask, xK_Return), spawn "st")
        , ((mod4Mask .|. shiftMask, xK_q), kill)
        , ((mod4Mask .|. shiftMask, xK_x), spawn "betterlockscreen -l")
        , ((mod4Mask .|. controlMask .|. shiftMask, xK_BackSpace), io (exitWith ExitSuccess))
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
