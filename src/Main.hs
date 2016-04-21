{-# LANGUAGE OverloadedStrings #-}

module Main where

-- external imports
import Control.Monad
import Data.Monoid
import Data.Text
import Web.Spock.Safe
import Text.Blaze.Html (Html, toHtml)
import Text.Blaze.Renderer.Utf8 (renderMarkup)
import Database.Persist
import Database.Persist.Sqlite (runSqlite, runMigration)
import Control.Monad.IO.Class (liftIO)
-- local imports
import Views.Index
import Views.Results
import Models.Vote

-- render the given view for the spock server
renderView view = lazyBytes (renderMarkup view)

---- execute a query over the local database
--runDb :: SqlPersist (ResourceT . withSqliteConn "dev.sqlite3" . runSqlConn $ query

--getVotes = runSqlite "../votes.db" $ do
--    buildDb

dbName :: Text
dbName = "votes.db"

main :: IO ()
main = do
    runSqlite dbName $ runMigration migrateAll 

    -- run the web server
    runSpock 8080 $ spockT id $ do 
        Web.Spock.Safe.get root $ renderView indexView
        Web.Spock.Safe.get "/results" $ renderView (resultView 2)