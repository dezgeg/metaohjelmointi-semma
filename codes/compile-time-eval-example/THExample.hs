module THExample where
import Language.Haskell.TH.Lib
import Language.Haskell.TH.Syntax

compileTimeEval :: Integer -> Q Exp
compileTimeEval i = litE (integerL i)
