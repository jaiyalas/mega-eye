module Main where

import Lib
import SFML.Window
import SFML.Graphics

import Control.Monad

-- this is necessary for getDataFileName
import Paths_dofu

main :: IO ()
main = do
    main2
    t1 <- getDataFileName "img/look.jpg"
    putStrLn t1
    let ctxSettings = Just $ ContextSettings 24 8 0 1 2 [ContextDefault]
    wnd <- createRenderWindow (VideoMode 550 690 32) "SFML Haskell Demo" [SFDefaultStyle] ctxSettings
    tex <- err $ textureFromFile t1 Nothing
    spr <- err $ createSprite
    setTexture spr tex True
    loop wnd spr
    destroy spr
    destroy tex
    destroy wnd

main2 :: IO ()
main2 = mapM_ ((=<<) putStrLn)
    [ ( return $ show version )
    , getBinDir
    , getLibDir
    , getDynLibDir
    , getDataDir
    , getLibexecDir
    , getSysconfDir
    ]


    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    -- desktopMode <- getDesktopMode
    -- fsModes <- getFullscreenModes
    --
    -- putStrLn $ "Current desktop mode:\n\n" ++ show desktopMode
    -- putStrLn ""
    -- putStrLn $ "Fullscreen modes:"
    -- putStrLn ""
    -- mapM_ (\m -> putStrLn (show m) >> putStrLn "") fsModes
    --
    -- let ctxSettings = Just $ ContextSettings 24 8 0 1 2 [ContextDefault]
    -- wnd <- createWindow (VideoMode 640 480 32) "SFML Haskell Demo" [SFDefaultStyle] ctxSettings
    -- loop wnd
    -- destroy wnd
--
loop :: RenderWindow -> Sprite -> IO ()
loop wnd spr = do
    drawSprite wnd spr Nothing
    display wnd
    evt <- waitEvent wnd
    case evt of
        Nothing -> return ()
        Just SFEvtClosed -> return ()
        _ -> loop wnd spr
--
-- loop :: Window -> IO ()
-- loop wnd = do
--     evt <- waitEvent wnd
--     case evt of
--         Just SFEvtClosed -> return ()
--         _ -> loop wnd
