Haskell Tutorial
(C) 2013 Abram Hindle CC-BY 3.0
For Edmonton Functional Programmers Users Group

Hi this is a literate program

Code is written with > in front of it. This is called bird style.

> f x = 2 * x

How do we write a function with args?

> mul x y = x * y

How do we call mul?

> mulres1 = mul 2 3  

Or

> mulres2 = mul (mul 2 3) (mul 2 3)

type in :type mul

*Main> :type mul
mul :: Num a => a -> a -> a

a is of typeclass Num (numbers)

and mul is a function that takes an a, takes an a, and produce an a

OR mul takes a Num a and produces a function that takes a Num a and produces a Num a

> double = mul 2

*Main> :type double
double :: Integer -> Integer

> dres = double 16

So we made a 1 argument function by partially providing all the
arguments to mul.  This is currying! It allows for easy function
composition, maybe it is a little crazy but you see it too much in
haskell to ignore.

So we can make functions and it seems we have numbers, but we can make
our own types as well.

But we can't print it until we say we can show it using "deriving Show"

> data Dirs = DLeft | DRight deriving Show

We can make functions with these datatypes too

> opposite DLeft = DRight
> opposite DRight = DLeft

This isn't 2 functions, this is pattern matching.

*Main> :t opposite
opposite :: Dirs -> Dirs

So lets imagine we have a robot and it can face N E S W and it can 
turn left or right

We can declare a new datatype

We add a bunch of typeclasses
Eq for equality
Show for printing
Ord for Ordinal (they are in order)
Enum of enumeration which means we can use succ (successor) and pred
(predecessor)

Typeclasses are like inheritenance on data types.

> data Faces = North | East | South | West deriving (Show,Eq,Ord,Enum)

> turn West DRight = North
> turn North DLeft = West
> turn x DLeft = pred x
> turn x DRight = succ x

We can write a new function

> turnleft face = turn face DLeft
> turnright face = turn face DRight

So now we've got data types and pattern matching.

Now let's cover some data types real quick

> bools = True || False
> ints = 4
> floats = 4.0
> strings = "String!"
> chars = 'a'

We can use these types in other types like say lists of integers.

> evens = [0,2,4,6,8]
> odds  = [1,3,5,7,9]

odds :: [Integer] <--- list of Integers

> six = evens !! 3
> three =  odds !! 2
> zero = head evens
> one = head odds
> olist =  tail odds
> extrazero = 0 : evens -- add an 0 on the head of evens
> emptylist = []

How do we navigate lists or use them?

> diffhead (x:y:z) = x - y
> compareHeads (x:xs) (y:ys) = compare x y

What about iteration?

> compareLists [] [] = EQ
> compareLists (x:xs) [] = GT
> compareLists [] (x:xs) = LT
> compareLists (x:xs) (y:ys) =   
>  let cmp = compare x y in
>  if (cmp == EQ) then compareLists xs ys else cmp

What about mapping?

> doubleList = map (* 2)

(* 2) ? 
:t (* 2)
(* 2) :: Num a => a -> a

> multiply = foldr (*) 1 

> turnListLeft = map turnleft

This is overcomplicated

> turnAround dir = foldr (\x y -> turnleft y) dir [1,2]
> turnAround dir = turnleft ( turnleft dir )
> spin dir = foldr (\x y -> turnleft y) dir [1,2,3,4]
> spin dir = turnleft (turnleft (turnleft (turnleft dir)))

Writing better functions

> leftOrRight x = [r,l] where
>   l = turnleft x
>   r = turnright x 

Note order doesn't matter!

Where lets you define stuff out of order
let implies an order

> leftOrRight x = 
>   let r = turnright x in
>   let l = turnleft x in
>   [r,l]  

Recursion is easy

> leftTilNorth North = 0
> leftTilNorth x = 1 + (leftTilNorth (turnleft x))

