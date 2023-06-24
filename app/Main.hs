module Main (main) where

import Runner

main = do
    s <- readFile "program.fl"
    print $ run s