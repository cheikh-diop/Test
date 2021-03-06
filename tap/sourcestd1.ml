(*** Exercice  1  Pratique***)

 
(*** Exercice  2  Pratique***)
 
(*** Exercice  3  
Définir de nouveaux identificateurs :
(i) Définir x comme étant la valeur true et l’évaluer.
(ii) Redéfinir x comme étant la fonction sqrt et l’évaluer.
(iii) Définir la fonction 2 ∗ x + 3.
(iv) Définir la fonction 3 ∗ cos2
(x) + 1.
(v) Définir la fonction “valeur absolue” à l’aide d’une conditionnelle
***)

(** (i) Définir x comme étant la valeur true et l’évaluer. **))
let x =1;;

(** (ii) Redéfinir x comme étant la fonction sqrt et l’évaluer. **)

let sqrt= function x-> x*x;;

let sqrt(x) = x * x;;

  sqrt 2;;
    sqrt 4;;

(** (iii) Définir la fonction 2 ∗ x + 3. ***)
      
 let test1 = function x-> 2*x+3;;
   (* appel de la fonction test1 *) 
   test1 2;;

(**(iv) Définir la fonction 3 ∗ cos2 **)
   let function2 = function x->3*.cos(x)*.cos(x)+.1;;
     
   let function2(x) = 3. *. cos(x) *. cos(x) +. 1.;;
   function2(2.);;
(**(v) Définir la fonction “valeur absolue” à l’aide d’une conditionnelle **)
   let valabs(x) = if (x> 0) then  x else -x ;;
     valabs(-2);;
      
 (*** Exercice  4  ***)
(**1. Écrire une fonction make_even qui construit la partie paire d’une fonction f : **)
       
       let make_even(f,x) = f(x) + f(-x) / 2;;
         make_even(valabs,5);;
         (** 2. Écrire une fonction deriv approximant la dérivée d’une fonction f en un point x, à
l’aide du paramètre  non nul de la manière suivante : **)
           
         let f(x,eps) = x+.eps;;
         
         
         let deriv (x,epsi,f) = (f(x , epsi) -. f(x ,-.epsi)) /. (2.*.epsi) ;;

          deriv (2.,3.,f);;
(Exercice 5: Problèmes de récursivité***)

       (** fonction factoriel  **) 

          let rec fact   (x) =  if (x<=1) then x*1 else  x* fact (x-1) ;; 
         
            fact(3);;

            (** fonction Newton **)
            (** j'applique l'algorithme par rapport a la fonction f(x) = x^2  -a) qui aproximme la racine d'un  nombre passe en parametre**)

            let rec newton a  n = if n=1 then 1. else let x = ( newton a (n-1))  in x -. (((x *. x) -. a) /. (2. *. x));;
              newton 4. 10 ;;
         
let approx_pi n = 
  let rec approx_pi_rec n = 
    if (n = 0) then 0 else
      let a = approx_pi_rec (n-1) in 
      let u = Random.float 1. and v = Random.float 1. in 
        if (u*.u+.v*.v<=1.) then (a+4) else a 
  in (approx_pi_rec n,n);;
 
#include <stdlib.h>
#include <stdio.h>

int approx_pi_rec(int n, int s) {
  float a,b;

  if (n==0) 
    return(s);
  else {
    a = ((float) random())/RAND_MAX;
    b = ((float) random())/RAND_MAX;
    if ((a*a+b*b)<=1)
      return(approx_pi_rec(n-1,s+4));
    else
      return(approx_pi_rec(n-1,s));    
  }
}
   
void approx_pi(int n) {
  int s = approx_pi_rec(n,0);
  printf("Approx : %d/%d\n",s,n);
}  

int main(void) {
  approx_pi(10000);
  approx_pi(100000);
  approx_pi(1000000);
  approx_pi(10000000);
  return 1;
}
 
(*** Exercice  6  ***)
 
let rec chop k l =
  if k = 0 then l else begin
    match l with
    | x::t -> chop (k-1) t
    | _ -> assert false
  end
;;

let stable_sort l =
  let rec rev_merge l1 l2 accu =
    match l1, l2 with
    | [], l2 -> List.rev_append l2 accu
    | l1, [] -> List.rev_append l1 accu
    | h1::t1, h2::t2 ->
        if h1 <= h2
        then rev_merge t1 l2 (h1::accu)
        else rev_merge l1 t2 (h2::accu)
  in
  let rec rev_merge_rev l1 l2 accu =
    match l1, l2 with
    | [], l2 -> List.rev_append l2 accu
    | l1, [] -> List.rev_append l1 accu
    | h1::t1, h2::t2 ->
        if h1 > h2 
        then rev_merge_rev t1 l2 (h1::accu)
        else rev_merge_rev l1 t2 (h2::accu)
  in
  let rec sort n l =
    match n, l with
    | 2, x1 :: x2 :: _ ->
       if x1 <= x2 then [x1; x2] else [x2; x1]
    | 3, x1 :: x2 :: x3 :: _ ->
       if x1 <= x2 then begin
         if x2 <= x3 then [x1; x2; x3]
         else if x1 <= x3 then [x1; x3; x2]
         else [x3; x1; x2]
       end else begin
         if x1 <= x3 then [x2; x1; x3]
         else if x2 <= x3 then [x2; x3; x1]
         else [x3; x2; x1]
       end
    | n, l ->
       let n1 = n asr 1 in
       let n2 = n - n1 in
       let l2 = chop n1 l in
       let s1 = rev_sort n1 l in
       let s2 = rev_sort n2 l2 in
       rev_merge_rev s1 s2 []
  and rev_sort n l =
    match n, l with
    | 2, x1 :: x2 :: _ ->
       if x1 > x2 then [x1; x2] else [x2; x1]
    | 3, x1 :: x2 :: x3 :: _ ->
       if x1 > x2 then begin
         if x2 > x3 then [x1; x2; x3]
         else if x1 > x3 then [x1; x3; x2]
         else [x3; x1; x2]
       end else begin
         if x1 > x3 then [x2; x1; x3]
         else if x2 > x3 then [x2; x3; x1]
         else [x3; x2; x1]
       end
    | n, l ->
       let n1 = n asr 1 in
       let n2 = n - n1 in
       let l2 = chop n1 l in
       let s1 = sort n1 l in
       let s2 = sort n2 l2 in
       rev_merge s1 s2 []
  in
  let len = List.length l in
  if len < 2 then l else sort len l
;;

stable_sort [4;2;5;3];;
stable_sort ["mauve";"bleu";"blanc";"carmin"];;
 
