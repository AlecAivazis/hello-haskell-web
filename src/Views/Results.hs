{-# LANGUAGE OverloadedStrings #-}

module Views.Results where

-- external imports
import Data.Monoid
import Web.Spock.Safe
import Text.Blaze.XHtml5 ((!))
import qualified Text.Blaze.XHtml5 as H
import qualified Text.Blaze.XHtml5.Attributes as A

resultView :: Int -> H.Html
resultView number =
    do H.p (H.toHtml number)