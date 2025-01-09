import System.Random
import GHC.Base (IO(IO))

generateRandom :: Int -> Int -> IO Int
generateRandom upper lower = randomRIO (lower, upper)

guessingGame lower upper = do
    putStrLn "Welcome to the guessing game"
    target <- generateRandom upper lower
    playGame target

playGame target = do
    putStrLn "Enter your guess: "
    guess <- readLn :: IO Int
    if guess < target
        then do
            putStrLn "Guess too low! try again"
            playGame target
    else if guess > target
        then do
            putStrLn "Guess too high! try again"
            playGame target
    else
        putStrLn "Congratulations! You guessed correctly!"


main :: IO ()
main = do
    guessingGame 1 100