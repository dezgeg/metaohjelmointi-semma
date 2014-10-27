infiniteRecursion :: Int -> Int
infiniteRecursion x = infiniteRecursion (x + 1)

nums = [1 `div` 0, 2, infiniteRecursion 3, 4]
main = do
    print (length nums)         -- tulostaa 4
    print (nums !! 1)           -- tulostaa 2 (listan 2. alkio)
    let divZeroPlusOne = (nums !! 0) + 1
    print (reverse nums !! 0)   -- tulostaa 4
    print divZeroPlusOne        -- suoritus keskeytyy virheeseen:
                                -- 'Laziness.hs: divide by zero'
    print "Not executed"        -- tätä ei enää tulosteta
