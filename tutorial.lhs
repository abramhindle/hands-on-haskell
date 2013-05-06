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


