{-# OPTIONS_GHC -Wall #-}

import Numeric.LinearAlgebra as N
import Prelude hiding ((<>))

m :: Matrix R
m = (2 >< 3) [1 ..]

v :: Vector R
v = vector [10, 20, 30]

a :: Matrix R
a = (3 >< 5) [1 ..] -- don't try to print this!

b :: Matrix R
b = (5 >< 2) [1, 3, 0, 2, -1, 5, 7, 7, 6, 0]

batchPrint :: (Show a) => [a] -> IO ()
batchPrint = mapM_ print

main :: IO ()
main = do
    print $ m #> v -- matrix-vector product
    print $ v <.> v -- dot product of 2 vectors
    batchPrint
        [ b -- show matrix
        , a <> b -- matrix-matrix product
        ]
