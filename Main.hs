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
    setTitle "File Processor"
    toWidget [whamlet|
<h2>Previously submitted files
|]

main :: IO ()
main = warpEnv App
