{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}

module Handler.Home where

import Data.Default
import Yesod
import Yesod.Default.Util

import Foundation

getHomeR :: Handler Html
getHomeR = do
    filenames <- getList
    defaultLayout $ do
        setTitle "File Processor"
        $(widgetFileNoReload def "home")
