-- a truth machine is a program which takes STDIN
-- if STDIN is 0, it displays a 0 and terminates
-- if STDIN is 1, it displays 1 forever

import Control.Monad (forever)
infi = do 
    putStrLn "1" 
    infi
main = do 
    a <- readLn :: IO Int 
    if a == 0 then putStrLn "0" else if a == 1 then infi else putStrLn "other"