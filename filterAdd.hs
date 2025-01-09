import Data.Char (isDigit, digitToInt)
import Text.Printf (IsChar(toChar))
-- Given a non-empty string containing numbers, uppercase and lowercase letters, output the sum of the remaining numbers. 
main :: IO ()
main = do
    a <- getLine
    print(sum $ map digitToInt $ filter isDigit a)