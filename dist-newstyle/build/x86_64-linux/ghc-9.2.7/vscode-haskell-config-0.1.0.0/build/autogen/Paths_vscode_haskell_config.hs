{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_vscode_haskell_config (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
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

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/lhome/hulandg/.cabal/bin"
libdir     = "/lhome/hulandg/.cabal/lib/x86_64-linux-ghc-9.2.7/vscode-haskell-config-0.1.0.0-inplace"
dynlibdir  = "/lhome/hulandg/.cabal/lib/x86_64-linux-ghc-9.2.7"
datadir    = "/lhome/hulandg/.cabal/share/x86_64-linux-ghc-9.2.7/vscode-haskell-config-0.1.0.0"
libexecdir = "/lhome/hulandg/.cabal/libexec/x86_64-linux-ghc-9.2.7/vscode-haskell-config-0.1.0.0"
sysconfdir = "/lhome/hulandg/.cabal/etc"

getBinDir     = catchIO (getEnv "vscode_haskell_config_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "vscode_haskell_config_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "vscode_haskell_config_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "vscode_haskell_config_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "vscode_haskell_config_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "vscode_haskell_config_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
