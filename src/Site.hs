{-# LANGUAGE OverloadedStrings #-}

------------------------------------------------------------------------------
-- | This module is where all the routes and handlers are defined for your
-- site. The 'app' function is the initializer that combines everything
-- together and is exported by this module.
module Site
  ( app
  ) where

------------------------------------------------------------------------------
import           Control.Monad.IO.Class
import           Data.ByteString (ByteString)
import qualified Data.Text as T
import           Heist
import qualified Heist.Interpreted as I
import           Snap.Core
import           Snap.Snaplet
import           Snap.Snaplet.Auth
import           Snap.Snaplet.Auth.Backends.JsonFile
import           Snap.Snaplet.Heist
import           Snap.Snaplet.Session.Backends.CookieSession
import           Snap.Util.FileServe
------------------------------------------------------------------------------
import           Application

------------------------------------------------------------------------------
handleLogin :: Maybe T.Text -> Handler App (AuthManager App) ()
handleLogin authError = do 
  liftIO $ print $ authError
  heistLocal (I.bindSplices errs) $ render "index"
  where
    errs = maybe noSplices splice authError
    splice err = "loginError" ## I.textSplice err

------------------------------------------------------------------------------
handleLoginSubmit :: Handler App (AuthManager App) ()
handleLoginSubmit = do
    eitherAuthFailureOrUser <- registerUser "login" "password"
    case eitherAuthFailureOrUser of
      Left af  -> handleLogin $ Just . T.pack . show $ af
      Right _  -> loginUser "login" "password" Nothing
                    (\_ -> handleLogin $ Just err)
                    (redirect "/#chatroom")
  where
    err = "Unknown user or password"
    

------------------------------------------------------------------------------
-- | The application's routes.
routes :: [(ByteString, Handler App App ())]
routes = [ (""             , serveDirectoryWith fancyDirectoryConfig "public")
         , ("/"       , with auth (handleLogin Nothing))
         , ("login_submit" , with auth handleLoginSubmit)          
         ]

------------------------------------------------------------------------------
-- | The application initializer.
app :: SnapletInit App App
app = makeSnaplet "app" "An snaplet example application." Nothing $ do
    h <- nestSnaplet "" heist $ heistInit "templates"
    s <- nestSnaplet "sess" sess $
           initCookieSessionManager "site_key.txt" "sess" (Just 3600)
    a <- nestSnaplet "auth" auth $
           initJsonFileAuthManager defAuthSettings sess "users.json"
    addRoutes routes
    addAuthSplices h auth
    return $ App h s a
