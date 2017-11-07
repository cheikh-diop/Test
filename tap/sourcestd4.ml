(********* Exercice  1  *********)
 
let rec sum l = match l with
  | []    -> 0
  | x::xs -> x + (sum xs);;

let rec length l = match l with 
  | []    -> 0
  | _::xs -> 1 + (length xs);;

let maximum l = 
  let rec max_rec l m = match l with 
    | []    -> m
    | x::xs -> max_rec xs (max m x)
  in max_rec l (List.hd l);;
(** Question 1 
fold_left et fold_right : 
-->fold_left prend une fonction et une liste et applique la fonction sur chaque element de la liste en reutilisant le resultat du calcul precedant sur les calculs suivantes  fold_left est recursif terminal
-->fold_right  prend une fonction et une liste et applique la fonction sur chaque element de la liste en reutilisant le resultat du calcul precedant sur les calculs suivantes  fold_left est non recursif terminal**) 


(** Question 2 **)
  (** Utiliser la fonction fold pour recoder les lignes ci dessus **)
(** Fonction SUM  **)





  
let sum_fold_left l =
  
  List.fold_left ( fun sum x -> sum +x ) 0 l ;;


    sum (+) [1;2;3;4];; 

    (**  Fonction taille liste **)
let lgt_fold l =
  List.fold_left ( fun lgt x -> lgt + 1) 0 l ;;
 (** Fonction max dans un liste **)
let max_fold_left l =
( fun n x  -> max n x  ) 0 l;;
(** Question 3 **)
(**Fonction qui renvoie vrai si un element de la liste est vraie   **)  
  let or_fold l ( fun orf x -> orf || x ) 0 l: 
  
  
(********* Exercice  2  *********)
 
using System;
using System.Collections.Generic;
using System.Linq;

class Program {

private static List<string> people =new List<string>(){
"Robert", "Roger", "Raymond", "Remi",
"Radicowl", "Ross", "Rififi", "Rossinante"};


(** Exo 2 - Questions 5 Fonction Fold**)
public static B Fold<A,B>(Func<B,A,B> f,B init,IEnumerable<A> l ){
	B acc=init;
	foreach(A a in l){
		acc=f(acc,a);


}
	return  acc ;
}

/*

(** Exo 2 - Questions 6**)
public static B Fold<A,B>(Func<B,A,B> f,B acc,IEnumerator<A> l ){
	if (l.MoveNext())
	{
		return (Fold<A,B>(f,f(acc,l.Current),l));
	}
	else {
		return acc;
	}
}
*/
public static void Main() {
IEnumerable<string> people1 = from p in people select p;
(** Exo 2 - Questions 1 : Ecrire une requete qui selectionne les mots de la liste contenant plus de 5 lettres et ordonnes par ordre (croissant ou decroissant **) 

IEnumerable<string> query = from p in people  where p.Length>5 orderby p descending select p ;
(** Exo 2 - Questions  2 : Reecrire la requete de l'exercice 1 en appliquant a la liste people des methodes agissant sur les IEnumerable<T>**)
//IEnumerable<string> queryM = people.Where(p => p.Length>5 ).OrderByDescending(p=>p);
(** Exo 2 - Questions 7 : Appliquer Fold pour compter le nombre d'element de la liste**)
int count = query.Aggregate(0 , (acc , list) => 1+acc);
(** Exo 2 - Questions 6 : Appliquer Fold pour concatener les elements de la liste**)
string result = Fold<string,string>((current, next) => current+next ,"",query);
Console.WriteLine(" Concatenate with Fold "+result);
/*foreach (string person in queryM)
//Console.WriteLine(person);
*/
}

}

 (** Exo 2 - Questions 3 : Style de programmation impose par le systeme oriente methode **)

Le systeme oriente methode impose la chainage des methodes pour relayer le contexte d'instruction d'un appel ulterieur .
 Le principal avantage est que le code est facilement comprehensible .
(** Exo 2 - Questions 6 : Quel est le but des differses formes de la fonction agregate **)
la fonction aggregate fait la meme chose que la fonction fold

(********* Exercice  3  *********)
(** Exo 3 - Questions 1 : Code qui permet de faire calculer au preprocesseur les nombres factoriel  **)

#include <cstdlib>
#include <iostream>
#include <vector>

using namespace std; 

template <unsigned int N>
struct Factorielle
{
	enum { value = N* Factorielle<N-1>::value  };

};
template <>
struct Factorielle<0>
{
	enum { value = 1  };

}; 

template <unsigned long N>
struct binary
{
  static unsigned const value = binary<N/10>::value *2 + N%10;
};

template <>
struct binary<0>
{
  static unsigned const value = 0;
};

int main(void)
{
  cout << "1010 : " << binary<1010>::value << endl;
  cout << "1110 : " << binary<1110>::value << endl;
  cout << "1011 : " << binary<1011>::value << endl;
}
 
#include <cstdlib>
#include <iostream>
#include <vector>
using namespace std;

// The class IntSwap<I,J> is a simple class containing a function 
// for swapping integers at indices I and J in an array if necessary 
template <int I, int J> class IntSwap {
public:
    static inline void compareAndSwap(int *data) {
      if ( data[I] > data[J] )
        swap( data[I], data[J]);
    }
};

// The class IntBubbleSortLoop<I,J> will swap the element at index J 
// with the element at index J+1 if necessary, then go on until it 
// reaches the end of the array, whose length is represented by I.
template <int I, int J> class IntBubbleSortLoop {
private:
    enum { go = ( J <= I-2 ) };
public:
    static inline void loop(int *data) {
      cout << "Loop " << I << " " << J << endl;
      IntSwap<J, J+1>::compareAndSwap(data);
      IntBubbleSortLoop< go ? I : 0, go ? (J+1) : 0 >::loop(data);
    }
};

template <> class IntBubbleSortLoop<0,0> {
public:
    static inline void loop(int *)  { }
};

// The class IntBubbleSort<N> is a class containing a function sort that 
// applys a bubble sort to a given array. 
template <int N> struct IntBubbleSort {
    static inline void sort(int *data) {
        IntBubbleSortLoop<N-1,0>::loop(data);
        IntBubbleSort<N-1>::sort(data);
    }
};

template <> struct IntBubbleSort<1> {
    static inline void sort(int *data) { }
};

int main(void) {
  int int_list[10] = {10,7,4,8,2,5,3,1,9,6};
  IntBubbleSort<10>::sort(int_list);

  for (int i=0; i<10; i++)
    cout << int_list[i] << ' ';
  cout << endl;
  return EXIT_SUCCESS;
}
(** Exercice 3 Question 2 **)
//*****iteration 1************
//  IntBubbleSort<4>::sort(liste) { : 4 est le nombre d'éléments dans la liste et liste est la liste d'entiers qu'on veux trier
//  IntBubbleSortLoop<3,0>::loop(liste); 3 est le nombre de boucles On commencer à trier la liste à partir de l'indice 0 
//  Loop 3 0
//  IntSwap(0,1): Comparaison de deux éléments succéssives et les mettre en ordre croissant ici on compare l'élément d'indice 0 et d'indice 1 
// expansion : 8 11 5 9

//  IntBubbleSortLoop<3,1>::loop(liste); Se positionner pour aller à l'indice suivant 1
//  Loop 3 1
//  IntSwap(1,2); 
// expansion : 8 5 11 9

//  IntBubbleSortLoop<3,2>::loop(liste);
//  Loop 3 2
//  IntSwap(2,3) }
//  expansion : 8 5 9 11
//iteration 2
//  IntBubbleSort<3>::sort(liste) {
//  IntBubbleSortLoop<2,0>::loop(liste);
//  Loop 2 0
//  IntSwap(0,1)
// expansion  5 7 8 11

//  IntBubbleSortLoop<2,1>::loop(liste);
//  Loop 2 1
//  IntSwap(1,2)
// expansion : 5 8 9 11
//iteration 3
//  IntBubbleSort<2>::sort(liste) {
//  IntBubbleSortLoop<1,0>::loop(liste);
//  Loop 1 0
//  IntSwap(0,1)
// expansion  5 7 8 10
//iteration 4
//  IntBubbleSort<1>::sort(liste) 


(** Exercice 3 Question 3 **)
Le fait que aucune variables ne peut changer de valeur une fois qu'elle a ete initialisee est le lien qui relie la programmation fonctionnelle et la metaprogrammation 

