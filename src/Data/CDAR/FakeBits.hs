{- |The FakeBits module is a poor man's replacement for Data.Bits.
    We need it for GHCJS 8.0.2 (and maybe later) as some primitives
    for the Data.Bits.Bits Integer instance are missing.
-}
module Data.CDAR.FakeBits where

bit :: Int -> Integer
bit i = 2 ^ i

testBit :: Integer -> Int -> Bool
testBit x i = odd $ x `div` (2 ^ i)

shift :: Integer -> Int -> Integer
shift x i 
    | i >= 0 = x * (2 ^ i)
    | otherwise = x `div` (2 ^ (negate i))

unsafeShiftL :: Integer -> Int -> Integer
unsafeShiftL x i = x * (2 ^ i)

unsafeShiftR :: Integer -> Int -> Integer
unsafeShiftR x i = x `div` (2 ^ i)