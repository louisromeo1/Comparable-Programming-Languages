(* PA1 - Louis Romeo *)
(* Date: 2/14/2024 *)
(* Course: CSC 372 *)
(* Purpose: Implements various small functions in SML *)

(* Question 1 *)
fun triangle(a, b, c) =
  if (a + b > c) andalso (b + c > a) andalso (a + c > b) then
      true
  else
      false;

(* Question 2 *)
fun triangleR(a, b, c) =
  if (a + b > c) andalso (b + c > a) andalso (a + c > b) then
      true
  else
      false;

(* Question 3 *)
fun addPairs ((a, b), (c, d)) = (a + c, b + d);

(* Question 4 *)
fun cycle(0, lst) = lst
  | cycle(_, []) = []
  | cycle(n, x::xs) = cycle(n-1, xs @ [x]);

(* Question 5 *)
fun last [x] = x
  | last (_::xs) = last xs;

(* Question 6 *)
fun pairs ([], _) = []
  | pairs (_, []) = []
  | pairs (x::xs, y::ys) = (x, y) :: pairs(xs, ys)

(* Question 7 *)
fun divideList ([], _) = []
  | divideList (x::xs, r) = (x / r) :: divideList(xs, r)

(* Question 8 *)
fun mirror [] = []
  | mirror (x::xs) = (x::mirror xs) @ [x];

(* Question 9 *)
fun removeZeros [] = []
| removeZeros (x::xs) = if x = 0 then removeZeros xs else x :: removeZeros xs;

(* Question 10 *)
fun gtList ([], _) = []
  | gtList (x::xs, n) =
      if x > n then
          x :: gtList(xs, n)
      else
          gtList(xs, n);

(* Question 11 *)
fun prefix ([], _) = true
  | prefix (_, []) = false
  | prefix (x::xs, y::ys) = 
      if x = y then
          prefix (xs, ys)
      else
          false;

(* Question 12 *)
fun get ([], _) = raise Empty (* Raises empty list exception *)
  | get (x::xs, 0) = x
  | get (_::xs, i) = get (xs, i - 1);

(* Question 13 *)
fun subList (lst, i, j) =
  let
      fun takeN(_, 0) = [] (* Helper function for taking integers *)
        | takeN([], _) = []
        | takeN(x::xs, n) = x :: takeN(xs, n - 1)

      fun dropN(lst, 0) = lst (* Helper function for dropping integers *)
        | dropN([], _) = []
        | dropN(x::xs, n) = dropN(xs, n - 1)

      val dropped = dropN(lst, i)
  in
      takeN(dropped, (j - i) + 1)
  end;

(* Question 14 *)
fun condense [] = []
  | condense [x] = [x]
  | condense (x::y::rest) = (x andalso y) :: condense rest;

(* Question 15 *)
fun insert (x, []) = [x]
  | insert (x, y::ys) =
      if x <= y then
         x :: y :: ys
      else
          y :: insert(x, ys);

(* Question 16 *)
fun merge ([], ys) = ys
  | merge (xs, []) = xs
  | merge (x::xs, y::ys) =
      if x < y then
          x :: merge(xs, y::ys)
      else
          y :: merge(x::xs, ys);

(* Question 17 *)
fun reverse [] = []
  | reverse (x::xs) = (reverse xs) @ [x];

(* Question 18 *)
fun zip ([], _) = []
  | zip (_, []) = []
  | zip (x::xs, y::ys) = x :: y :: zip(xs, ys);

(* Question 19 *)
fun apply ([], _) = []
  | apply (x::xs, f) = f x :: apply(xs, f);

(* Question 20 *)
fun collapse ([], acc, _) = acc
  | collapse (x::xs, acc, f) = collapse(xs, f(x, acc), f);


