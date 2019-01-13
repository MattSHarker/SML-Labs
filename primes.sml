(* Matthew Harker *)

fun makeLst n =
    if n = 0 then nil
    else makeLst(n-1) @ [n];

fun removeMult (lst, n) =
    if null lst then []
    else
        if (hd lst) mod n = 0
            then removeMult(tl lst, n)
            else (hd lst)::removeMult(tl lst, n);

fun sieve lst =
    if null lst then nil
    else (hd lst)::sieve(removeMult(tl lst, hd lst));

fun primes n = [1] @ sieve(tl(makeLst n));
(* I added the [1] @ ... to ensure that 1 would be included in the printed list*)