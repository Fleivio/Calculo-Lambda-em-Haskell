module Main (main) where

import Runner

main :: IO ()
main = do
    s <- readFile "program.f"
    print $ run s