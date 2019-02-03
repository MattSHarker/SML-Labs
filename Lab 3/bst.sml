(* Matthew Harker *)
(* CS 362 Lab 3 *)


(* l subtree, r subtree, key, value *)
datatype BST = Empty | Node of BST * BST * int * int;


(* inserts a new node into a binary tree, if the key is the same as a current one the old one is replaced *)
(* takes in a BST, key, and value and returns a BST *)
fun insert (Empty, nkey, nval)              = Node(Empty, Empty, nkey, nval)
  | insert (Node(l, r, key, v), nkey, nval) = 
        if (nkey = key)
            then Node(l, r, key, nval)
            else  if (nkey < key)
                    then insert(l, nkey, nval)
                    else insert(r, nkey, nval);

(* searches through the tree to see if it contains a specific key *)
(* if it does then return the corresponding value *)
fun find (Empty, nkey)                = []
  | find (Node(l, r, key, v), nkey) = 
        if nkey = key
            then [v]
        else if nkey < key
            then find (l, nkey)
        else
            find (r, nkey);
(*)
(* delete (bst * key(int) -> bst) *)
fun delete (Empty, nkey) = Empty
  | delete (Node(l, r, key, v), nkey) =
        if nkey < key
            then delete(l, nkey)
        else if nkey > key
            then delete(r, nkey)
        else
            let
                fun del Empty = Nil
                  | del(Node(Empty, Empty, key, v)) =       (* No sub trees *)
                        fn Node(Empty, Empty, key, v) => nil
                  | del(Node(l, Empty, key, v)) =           (* Left sub tree *)
                        aasd
                  | del Node(Empty, r, key, v) = 
                        aas
                  | del Node(l, r, key, v) =
                        let
                            max Node(_, Empty, k, tv) = Node
                          | max Node(_, r, k, tv) = max r
                        
                        in


            in

            end
*)
(* postorder(bst) | BST -> int * int * int *)
(* ints: type of tree, key, value *)
(* type of tree: 0 has no children, 1 has left child, 2 has right child, 3 has both *)
fun postorder Empty            = Nil
  | postorder Node(l, r, k, v) = 
        let
            fun tType (Empty, Empty) = 0
              | tType (tl, Empty) = 1
              | tType (Empty, tr) = 2
              | tType (tl, tr) = 3
        in
            let
                val tt = tType(l, r)
            in
                postorder (l) @ postorder (r) @ [(tt, k, v)]
            end
        end

fun parsePost [] = Empty
    parsePost lst =
    let
        fun pP (stack, (0,key,v)::str) = pP(Node(Empty, Empty, key, v)::stack, str)
        |   pP (L::stack, (1,key,v)::str) = pP(Node(L, Empty, key, v)::stack, str)
        |   pP (R::stack, (2,key,v)::str) = pP(Node(Empty, R, key, v)::stack, str)
        |   pP (R::L::stack, (3,key,v)::str) = pP(Node(L, R, key, v)::stack, str)
        |   pP (T::stack, []) = T;
    in
        pP([],lst)
    end;


val exTree0 = []
val exTree1 = [(0,1,1),(0,3,3),(3,2,2)];
val exTree2 = [(0,2,2),(2,1,1),(0,4,4),(3,3,3),(0,6,6),(1,7,7),(3,5,5)];
val exTree3 = [(0,1,1),(0,4,4),(1,5,5),(3,2,2),(0,8,8),(0,15,15),(2,14,14),(3,11,11)];
