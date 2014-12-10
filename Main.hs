{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module Main where

import Data.Default
import Yesod
import Yesod.Default.Util

data App = App
instance Yesod App

mkYesod "App" $(parseRoutesFile "config/routes")

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    let filenames = ["readme.txt", "report.pdf", "music.mp3"] :: [String]
    setTitle "File Processor"
    $(widgetFileNoReload def "home")

main :: IO ()
main = warpEnv App
