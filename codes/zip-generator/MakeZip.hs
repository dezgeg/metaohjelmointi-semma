{-# LANGUAGE TemplateHaskell #-}
module MakeZip where
import Language.Haskell.TH.Lib
import Language.Haskell.TH.Syntax

makeZip :: Int -> Q Dec
makeZip arity = let
  functionName = mkName (if arity == 2 then "zip" else "zip" ++ show arity)
  argNames = map (\i -> mkName ("l" ++ show i)) [1..arity]

  body = runQ [| if or $(isEmptyExprs)
                    then []
                    else $(tupleExpr) : $(recursiveCallExpr) |]

  isEmptyExprs = listE (map (\v -> [| null $(varE v) |]) argNames)
  tupleExpr = tupE (map (\v -> [| head $(varE v) |]) argNames)
  recursiveCallExpr = appsE (varE functionName :
                                map (\v -> [| tail $(varE v) |]) argNames)

  clauses = [clause (map varP argNames) (normalB body) []]
      in runQ (funD functionName clauses)
