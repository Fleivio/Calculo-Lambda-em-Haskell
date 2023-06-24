module Main (main) where

import Runner

main = do
    s <- readFile "program.js"
    print $ run s