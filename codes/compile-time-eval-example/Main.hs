{-# LANGUAGE TemplateHaskell #-}
module Main where
import THExample (compileTimeEval)

foo = $(compileTimeEval (sum [1..10000000]))
bar = 1 + $(compileTimeEval (1 `div` 0))

main = print (foo + bar)
