module Main (main) where

import Runner

main = do
    s <- readFile "program.js"
    runPrint s