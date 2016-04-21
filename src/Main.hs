{-# LANGUAGE OverloadedStrings #-}

module Main where

-- external imports
import Control.Monad
import Data.Monoid
import Web.Spock.Safe
import Text.Blaze.Html (Html, toHtml)
import Text.Blaze.Renderer.Utf8 (renderMarkup)
import Database.Persist
import Database.Persist.Sqlite
-- local imports
import Views.Index
import Views.Results
import Models.Vote

-- render the given view for the spock server
renderView view = lazyBytes (renderMarkup view)

-- execute a query over the local database
runDb :: SqlPersist (ResourceT IO) a -> IO a
runDb query = runResourceT . withSqliteConn "dev.sqlite3" . runSqlConn $ query


main :: IO ()
main =
    -- run any necessary migrations
    runDb $ runMigration migrateAll

    -- run the web server
    runSpock 8080 $ spockT id $
    do get root $ renderView indexView
       get "/results" $ renderView (resultView 2)