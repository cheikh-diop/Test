(********* Exercice  1  *********)

(** fonction qui retourne le 2  eme element d'un triplet **)

let acceselement2 x = match x with (a,b,c) -> b ;; 

  acceselement2 (1,2,3);;
    
(** fonction qui curryifie une fonction binaire quelconque                            **)
  let add (x,y) = x + y;;
  let  curry f x y  =   f ( x , y) ;;
  let add_curry = curry add ;; 
    add_curry 3 2 ;;

      (** fonction qui decurryfie une fonction binaire quelconque  **)

    let multi x y = x*y;;
    let uncurry   f (x,y) = f x y ;;
    let mult_uncurry= uncurry multi;;
     mult_uncurry(3,2);;

 (** fonction qui permet d'inverser l'ordre des arguments d'une fonction binaire  **)

     let diff x y = x- y ;;
     let inverse f x y = f y x ;;
     let inverse_diff=inverse diff;;
     inverse_diff 5 2;;
                       
       (** fonction iterate prenant en argument une fonction f et un nombre n qui renvoie l'iteree n eme de f  **)
       let inc x = x + 1 ;;
       let rec iterate (f:'a -> 'a) (n:'int) (x:'a) =
         if n = 0
         then x
         else f  ;;

       iterate inc 1;;
       
f : int -> int -> int
let plus x y = x+y;;
plus 2 3;;  (* -> 5 *)
 
g : (int*int) -> int
let fois (x,y) = x*y;;
fois (2,3);; (* -> 6 *)
 
(********* Exercice  2  *********)
 
(********* Exercice  3  *********)
 
type ratio = {
  num   : int; 
  denum : int};;  

let x = {num = 7; denum = 3 };;
x.num;; (* int = 7 *)
 
(********* Exercice  4  *********)
 
using System;
using System.Collections.Generic;

class Program {
  public static void Main() {
    // Create an association list
    List<KeyValuePair <int,string>> list = new List<KeyValuePair <int,string>>();

    // Fill it with interesting values
    list.Add(new KeyValuePair<int, string>(1,"un"));
    list.Add(new KeyValuePair<int, string>(7,"sept"));
    list.Add(new KeyValuePair<int, string>(1,"uno"));
  }
}
 
// Get a collection of the keys (names). 
List<int> keys = Map(list, i => i.Key);

// Print the values
foreach (int k in keys)
  Console.WriteLine("{0} : {1}", k, list.Find( i => (i.Key == k)).Value);  
 
