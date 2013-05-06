-- Haskell Tutorial
-- (C) 2013 Abram Hindle CC-BY 3.0
-- For Edmonton Functional Programmers Users Group

-- Hi this is a comment!

-- Hi this is a function f which takes an argument x and returns 2 * x
f x = 2 * x

-- now load this file in ghci
-- run: 
--      f 2

-- in ghci you can try new functions if you use the word 'let' before the function.
-- let f x = 3 * x

-- let's make the main function!
main = do
  print (f 2)
  
-- to compile it try
-- compile-haskell tutorial.hs
-- ghc tutorial.hs
-- if you get some --hash-size=31 error try to   
-- sudo ln -s /usr/bin/ld.bfd /usr/bin/ld
-- http://stackoverflow.com/questions/13046319/haskell-ghc-compiling-linking-error-not-creating-executable-linux
  
