{-# LANGUAGE TemplateHaskell #-}
import GenZip

$(makeZip 2)
$(makeZip 3)

main = return ()
