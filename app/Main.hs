module Main (main) where

import Runner

main :: IO ()
main = do
    s <- readFile "fibonacci.js"
    print $ run s