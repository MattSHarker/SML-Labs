(* Matthew Harker *)
(* CS 362 Lab 3 *)


(* l subtree, r subtree, key, value *)
datatype BST = Empty | Node of BST * BST * int * int;


(* inserts a new node into a binary tree, if the key is the same as a current
   one the old one is replaced
   takes in a BST, key, and value and returns a BST *)
fun insert (Empty, nkey, nval)              = Node(Empty, Empty, nkey, nval)
  | insert (Node(l, r, key, v), nkey, nval) = 
        if (nkey = key)
            then Node(l, r, key, nval)
            else  if (nkey < key)
                    then Node(insert(l, nkey, nval), r, key, v)
                    else Node(l, insert(r, nkey, nval), key, v)


(* searches through the tree to see if it contains a specific key *)
(* if it does then return the corresponding value *)
fun find (Empty, nkey)                = []
  | find (Node(l, r, key, v), nkey) = 
        if nkey = key
            then [v]
        else if nkey < key
            then find (l, nkey)
        else
            find (r, nkey)
            

(* helper function for delete, couldn't get it to work in a let statement *)
fun delMin (Node(Empty, r, key, v)) = (key, v, r)
  | delMin (Node(l, r, key, v)) =
    let
        val (m, n, nl) = delMin(l)
    in
        (m, n, Node(nl, r, key, v))
    end


(* delete (bst * key(int) -> bst) *)
fun delete (Empty, nkey) = Empty
  | delete (Node(l, r, key, v), nkey) =
        if nkey < key
            then Node(delete(l, nkey), r, key, v)
        else if nkey > key
            then Node(l, delete(r, nkey), key, v)
        else
            case (l, r) of
                (Empty, _) => r
              | (_, Empty) => l
              | _ => let
                        val (m, n, r) = delMin(r)
                     in
                        Node(l, r, key, v)
                     end


(* postorder(bst) | BST -> int * int * int *)
(* ints: type of tree, key, value *)
(* type of tree: 0 has no children, 1 has left child, 2 has right child, 3 has both *)
fun postorder Empty                = []  
  | postorder (Node(l, r, key, v)) =  
        let 
            fun tType (Empty, Empty) = 0
              | tType (_, Empty)     = 1
              | tType (Empty, _)     = 2
              | tType _              = 3
        in
            let
                val tt = tType(l, r)
            in
                postorder (l) @ postorder(r) @ [(tt, key, v)]
            end
        end


(* Trims a tree such that it only has values between minKey and maxKey
   BST * int * int -> BST   (BST, minK, maxK) -> (BST) *)
fun subTree (Empty, minK, maxK) = Empty
  | subTree (Node(l, r, k, v), minK, maxK) =
        if (k < minK)
            then delete(Node(subTree(l, minK, maxK), subTree(r, minK, maxK), k,v), k)
        else if (maxK < k)
            then delete(Node(subTree(l, minK, maxK), subTree(r, minK, maxK),k,v), k)
        else
            Node(subTree(l, minK, maxK), (subTree(r, minK, maxK)), k, v)


fun parsePost [] = Empty
|   parsePost lst =
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
val exTree3 = [(0,1,1),(0,4,4),(1,5,5),(3,2,2),(1,8,8),(0,15,15),(2,14,14),(3,11,11)];