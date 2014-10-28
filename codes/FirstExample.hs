main = do
    putStrLn "Mikä on nimesi?"
    nimi <- getLine
    putStrLn (tervehdi nimi)

tervehdi hlo = "Hei, " ++ hlo ++ "!"
