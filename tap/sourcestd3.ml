(********* Exercice  1  *********)

(** fonction qui retourne le 2  eme element d'un triplet **)

let acceselement2 x = match x with (a,b,c) -> b ;; 

  acceselement2 (1,2,3);;
    
(** fonction qui curryifie une fonction binaire quelconque                            **)
  let add (x,y) = x + y;;
  let  curry f x y  =   f ( x , y) ;;
  let add_curry = curry add ;; 
    add_uncurry 3 2  ;;

(** fonction qui de-curryfie une fonction binaire quelconque  **)

    let multi x y = x*y;;
    let uncurry   f (x,y) = f x y ;;
    let mult_uncurry= uncurry multi;;
     mult_uncurry (3,2) ;;

 (** fonction qui permet d'inverser l'ordre des arguments d'une fonction binaire  **)

     let diff x y = x- y ;;
     let inverse f x y = f y x ;;
     let inverse_diff=inverse diff;;
     inverse_diff 5 2;;
                       
       (** fonction iterate prenant en argument une fonction f et un nombre n qui renvoie l'iteree n eme de f  **)
       let inc x = x + 1 ;;
       let rec iterate f n x = if n=0 then x
                               else if n=1
                               then f x
                               else f(iterate f(n-1) x);;
         
   
       iterate inc 2;;
       

(********* Exercice  2  *********)
(**  Fonction qui supprime le ou les elements d'une liste d'associations egaux a une cle donne **)
let rec list_remove k n =
  match n with
  [] -> []
|(k1,_) :: q when k1=k -> list_remove k q
| a::q -> a:: list_remove k q;;
 list_remove 3 [(1,"un"); (3,"trois")];;

  (** Fonction generique qui transforme tous les elements de la liste **)

  let rec list_map f n  =
    match n with 
    [] -> []
    |x:: l -> f x :: list_map f l;;

  let fst (x,y) = x;;
    
  list_map fst [("sinus",sin);("cosinus",cos)];;

 (** Excercice 2 Question 3 fonction recursif terminal de concatenation de 2 liste d'association **)
  let rec concat list1 list2 = match list1 with
     ....
 concat  [(1,2)] [(3,4)];;     

 (********* Exercice  3  *********)
  (** Question 1 : Definition type complexe avec 2 operations **)
  type complex = {
     reel : float;
     imag :float;
     add : complex-> complex
   };;
// Constructeur et Fonction addition
 let rec construct_complex im re = {
     reel =re;
     imag =im;
     add  x y = sum x y and
     sum x y z let
       r=z.reel+x; and
       i=z.imag+y;
         in construct_complex r i;
   }
   let z1 ={ reel =2.0; imag=3.0} 
   let z2={ reel=1.0 ; imag=1.5};;
     z1.add z2;;

(********* Exercice  4  *********)
 // Question 1
  using System;
using System.Linq;
using System.Collections.Generic;
public static class  Program {
// Definition de la fonction map 
public static IEnumerable<TO> Map<TI, TO>(this IEnumerable<TI> liste, 
                                          Func<TI, TO> mapper)
{
    foreach (var item in liste)
        yield return mapper(item);
}

public static void Main() {
// Create an association list
List<KeyValuePair <int,string>> list = new List<KeyValuePair <int,string>>();
// Fill it with interesting values
list.Add(new KeyValuePair<int, string>(1,"un"));
list.Add(new KeyValuePair<int, string>(7,"sept"));
list.Add(new KeyValuePair<int, string>(1,"uno"));

}

}
  // Question 2 : 
 .................
  // Question 3 :
 La programmation generique en C# est beaucoup trop verbeux par rapport a ocaml comme dans beaucoup de situation . 
