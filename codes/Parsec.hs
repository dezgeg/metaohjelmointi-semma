import Text.Parsec

javaIdentifier = (letter <|> char '_') >> (many (letter <|> char '_' <|> digit))

javaInteger = try hexNumber <|> octalNumber <|> decimalNumber
    where hexNumber     = char '0' >> oneOf "xX" >> many (oneOf "0123456789abcdefABCDEF")
          octalNumber   = char '0' >> many (oneOf "01234567")
          decimalNumber = oneOf "123456789" >> many digit
