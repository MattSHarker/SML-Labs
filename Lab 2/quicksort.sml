(* Matthew Harker *)
(* CS 362 Lab 2 *)


(* Takes a list and reverses it *)
fun reverse []      = []
  | reverse (x::xs) = (reverse xs) @ [x];


(* Returns the last element of a list *)
fun last [x]     = x
  | last (x::xs) = last xs;


(* Returns the middle element of a list *)
fun middle [x]     = x
  | middle (x::xs) = middle (reverse xs);


(* Returns the median of 3 integers *)
fun median (a, b, c) =
    let
        val Max = Int.max(a, Int.max(b, c))
        val Min = Int.min(a, Int.min(b, c))
    in
        a + b + c - Min - Max
    end;


(* Takes a list and figures out the pivot based off of the
   median of the first, last, and middle elements *)
fun pivot [x]     = x
  | pivot (x::xs) =
    median (x, middle (x::xs), last xs);


(* Takes a list and  seperates it into two lists based on the pivot*)
fun partition (nil, piv)   = (nil, nil)
  | partition (x::xs, piv) = 
    let
      val (sml, big) = partition (xs, piv)
    in
      if x <= piv
        then (x::sml, big)
        else (sml, x::big)
    end;


(* quicksorts a list *)
fun quicksort []      = nil
  | quicksort [x]     = [x]
  | quicksort (x::xs) =
    let
      val (sml, big) = partition ((xs), x)
    in
      quicksort sml @ [x] @ quicksort big
    end;