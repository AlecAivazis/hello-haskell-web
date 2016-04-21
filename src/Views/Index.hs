{-# LANGUAGE OverloadedStrings #-}

module Views.Index where

-- external imports
import Data.Monoid
import Web.Spock.Safe
import Text.Blaze.XHtml5 ((!))
import qualified Text.Blaze.XHtml5 as H
import qualified Text.Blaze.XHtml5.Attributes as A

indexView :: H.Html
indexView =
    do H.p "index"