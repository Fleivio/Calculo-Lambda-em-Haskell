{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_lambda (
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
bindir     = "/home/severino/Desktop/lambda/.stack-work/install/x86_64-linux/da93ae21389e16ea1270574cd32ed2cd6fe96f556de3cf0c08125f197656560d/9.2.8/bin"
libdir     = "/home/severino/Desktop/lambda/.stack-work/install/x86_64-linux/da93ae21389e16ea1270574cd32ed2cd6fe96f556de3cf0c08125f197656560d/9.2.8/lib/x86_64-linux-ghc-9.2.8/lambda-0.1.0.0-Fyuvixda4NkIfzb36ooaQ2-lambda-exe"
dynlibdir  = "/home/severino/Desktop/lambda/.stack-work/install/x86_64-linux/da93ae21389e16ea1270574cd32ed2cd6fe96f556de3cf0c08125f197656560d/9.2.8/lib/x86_64-linux-ghc-9.2.8"
datadir    = "/home/severino/Desktop/lambda/.stack-work/install/x86_64-linux/da93ae21389e16ea1270574cd32ed2cd6fe96f556de3cf0c08125f197656560d/9.2.8/share/x86_64-linux-ghc-9.2.8/lambda-0.1.0.0"
libexecdir = "/home/severino/Desktop/lambda/.stack-work/install/x86_64-linux/da93ae21389e16ea1270574cd32ed2cd6fe96f556de3cf0c08125f197656560d/9.2.8/libexec/x86_64-linux-ghc-9.2.8/lambda-0.1.0.0"
sysconfdir = "/home/severino/Desktop/lambda/.stack-work/install/x86_64-linux/da93ae21389e16ea1270574cd32ed2cd6fe96f556de3cf0c08125f197656560d/9.2.8/etc"

getBinDir     = catchIO (getEnv "lambda_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "lambda_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "lambda_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "lambda_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lambda_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lambda_sysconfdir") (\_ -> return sysconfdir)




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
