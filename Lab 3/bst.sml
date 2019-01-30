(* Matthew Harker *)
(* CS 362 Lab 3 *)


(* left subtree, right subtree, key, value *)
datatype BST = Empty | Node of BST * BST * int * int;


(* inserts a new node into a binary tree, if the key is the same as a current one the old one is replaced *)
(* takes in a BST, key, and value and returns a BST *)
fun insert (Empty, key, val)                  = (Node (Empty, Empty), key, val)
  | insert (Node(left, right, key, value), nkey, nvalue) =
        if nkey = key
            then
                nkey = key
                nval = value
            else
                if key < nkey
                    then

                    else


fun parsePost [] = Empty
    parsePost lst =
    let
        fun pP (stack, (0,k,v)::str) = pP(Node(Empty, Empty, k, v)::stack, str)
        |   pP (L::stack, (1,k,v)::str) = pP(Node(L, Empty, k, v)::stack, str)
        |   pP (R::stack, (2,k,v)::str) = pP(Node(Empty, R, k, v)::stack, str)
        |   pP (R::L::stack, (3,k,v)::str) = pP(Node(L, R, k, v)::stack, str)
        |   pP (T::stack, []) = T;
    in
        pP([],lst)
    end;






val exTree0 = []
val exTree1 = [(0,1,1),(0,3,3),(3,2,2)];
val exTree2 = [(0,2,2),(2,1,1),(0,4,4),(3,3,3),(0,6,6),(1,7,7),(3,5,5)];
val exTree3 = [(0,1,1),(0,4,4),(1,5,5),(3,2,2),(0,8,8),(0,15,15),(2,14,14),(3,11,11)];
