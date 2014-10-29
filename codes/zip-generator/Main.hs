{-# LANGUAGE TemplateHaskell #-}
import MakeZip(makeZip)

$(mapM makeZip [4..20])
main = print (zip6 [1] ['a'] ["b"] [4] [5] [6, 7])
