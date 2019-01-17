{-# OPTIONS_GHC -Wall #-}

import Numeric.LinearAlgebra as N
import Prelude hiding ((<>))

m :: Matrix R
m = (2 >< 3) [1 ..]

v :: Vector R
v = vector [10, 20, 30]

a :: Matrix R
a = (3 >< 5) [1 ..]

b :: Matrix R
b = (5 >< 2) [1, 3, 0, 2, -1, 5, 7, 7, 6, 0]

c :: Matrix R
c = uniformSample 1 5 $ replicate 3 (0.0, 1.0) -- 4x5 random uniform

dispList :: Int -> [Matrix Double] -> IO ()
dispList = mapM_ . disp

main :: IO ()
main = do
    print $ m #> v -- matrix-vector product
    print $ v <.> v -- dot product of 2 vectors
    dispList
        3 -- decimal precision to print
        [a, b, a <> b, c, c <> a]
        --        \----------\---- matrix-matrix product
