{-# LANGUAGE OverloadedStrings #-}

module Main where

-- external imports
import Data.Monoid
import Web.Spock.Safe
import Text.Blaze.Html (Html, toHtml)
import Text.Blaze.Renderer.Utf8 (renderMarkup)
-- local imports
import Views.Index
import Views.Results


-- render the given view for the spock server
renderView view = lazyBytes (renderMarkup view)


main :: IO ()
main =
    runSpock 8080 $ spockT id $
    do get root $ renderView indexView