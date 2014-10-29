{-# LANGUAGE TemplateHaskell #-}
module GenZip where
import Language.Haskell.TH.Lib
import Language.Haskell.TH.Syntax

makeZip :: Int -> Q [Dec]
makeZip arity = let
    myName = mkName ("myZip" ++ show arity)
    varNames = map (\i -> mkName $ "l" ++ show i) [1..arity]

    ifCondition = [| any null $(listE $ map varE varNames) |]
    tupleExpr = tupE $ map (\listVar -> [| head $(varE listVar) |]) varNames
    restExpr = appsE $ [varE $ myName] ++ map (\listVar -> [| tail $(varE listVar) |]) varNames
    body = runQ [| if $(ifCondition) then [] else $(tupleExpr) : $(restExpr) |]
    declaration = funD myName
        [clause
            (map varP varNames)
            (normalB body)
            []]
        in runQ declaration >>= \d -> return [d]
