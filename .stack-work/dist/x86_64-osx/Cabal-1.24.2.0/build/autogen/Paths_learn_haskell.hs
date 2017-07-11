{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_learn_haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sllewelyn/learn-haskell/.stack-work/install/x86_64-osx/lts-8.22/8.0.2/bin"
libdir     = "/Users/sllewelyn/learn-haskell/.stack-work/install/x86_64-osx/lts-8.22/8.0.2/lib/x86_64-osx-ghc-8.0.2/learn-haskell-0.1.0.0-G7ViZAPiN2JJfuckQN6wC4"
dynlibdir  = "/Users/sllewelyn/learn-haskell/.stack-work/install/x86_64-osx/lts-8.22/8.0.2/lib/x86_64-osx-ghc-8.0.2"
datadir    = "/Users/sllewelyn/learn-haskell/.stack-work/install/x86_64-osx/lts-8.22/8.0.2/share/x86_64-osx-ghc-8.0.2/learn-haskell-0.1.0.0"
libexecdir = "/Users/sllewelyn/learn-haskell/.stack-work/install/x86_64-osx/lts-8.22/8.0.2/libexec"
sysconfdir = "/Users/sllewelyn/learn-haskell/.stack-work/install/x86_64-osx/lts-8.22/8.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "learn_haskell_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "learn_haskell_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "learn_haskell_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "learn_haskell_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "learn_haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "learn_haskell_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
