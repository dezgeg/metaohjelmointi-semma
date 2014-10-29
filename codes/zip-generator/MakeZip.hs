{-# LANGUAGE TemplateHaskell #-}
module MakeZip where
import Language.Haskell.TH.Lib
import Language.Haskell.TH.Syntax

makeZip :: Int -> Q Dec
makeZip arity = let
    functionName = mkName (if arity == 2 then "zip" else "zip" ++ show arity)
    varNames = map (\i -> mkName ("l" ++ show i)) [1..arity]

    body = runQ [| if any (==True) $(isEmptyExprs)
                      then []
                      else $(tupleExpr) : $(recursiveCallExpr) |]

    isEmptyExprs = listE (map (\v -> [| null $(varE v) |]) varNames)
    tupleExpr = tupE $ map (\v -> [| head $(varE v) |]) varNames
    recursiveCallExpr = appsE ([varE $ functionName] ++
                              map (\v -> [| tail $(varE v) |]) varNames)

    declaration = funD functionName
        [clause
            (map varP varNames)
            (normalB body)
            []]
        in runQ declaration
