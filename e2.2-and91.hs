data Tree a = Empty | Bin a (Tree a) (Tree a)
member x Empty = False
member x (Bin n l r) | x < n = member x l
                   | x > n = member x r
                   | otherwise = True

input = (Bin 8 (Bin 5 (Bin 3 Empty Empty) (Bin 6 Empty Empty)) (Bin 10 (Bin 9 Empty Empty) (Bin 11 Empty (Bin 12 Empty Empty))))

quickerMember x Empty = False
quickerMember x (Bin n l r) = quickerMember' x (Bin n l r) n

quickerMember' x Empty possible = x == possible
quickerMember' x (Bin n l r) possible | x < n = quickerMember' x l possible
                                     | otherwise = quickerMember' x r n

main = print $ [member 8 Empty, member 8 input, member 11 input, member 18 input, quickerMember 8 Empty, quickerMember 8 input, quickerMember 11 input, quickerMember 18 input]
