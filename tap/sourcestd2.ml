(********* Exercice  1  *********)
 
let pi = 3.1415;;
let rot_gen pi (x,y,ang) = 
  let newx = x*.cos(ang*.pi) +. y*.sin(ang*.pi) in
  let newy = x*.sin(ang*.pi) -. y*.cos(ang*.pi) in (newx,newy);;
let rot = (rot_gen pi);;
let pi = "troispointquatorze";;
rot (1.,0.,1.);;
 
#include <stdio.h>

int i = 0;
int f (int j) { i = i + j;  return i; }

int main(void) {
  f(1); printf("%d, ", i); 
  f(2); printf("%d, ", i); 
  i=421; f(2); printf("%d \n", i); 
} 
 
using System;
class Program {
  public static void Main() {
    Console.WriteLine("Caramba !");
} } 

 
(********* Exercice  2  *********)
 
// Type declaration
public delegate int OneInt (int value);
// Anonymous function
public static OneInt square = new OneInt(i => i*i);
// One-time declaration using predefined type
public static Func<int, int> cube = i => i*i*i;
// Delegate using multiple arguments
public delegate void Concat (string s1, string s2);
public static Concat c = (a,b) =>
                            Console.WriteLine(a+b);
 
using System;
using Gtk;

public class GtkHelloWorld {
  static void onClick (object obj, EventArgs args) {
    Console.WriteLine("I have been clicked by a {0}", obj); }

  public static void Main() {
    Application.Init();
 
    //Create the Window
    Window myWin = new Window("Brave new world");
    myWin.Resize(200,200);
    HBox myBox = new HBox (false, 10);
    myWin.Add(myBox);

    // Set up a button object.
    Button hello = new Button ("Hello");
    hello.Clicked += new EventHandler(onClick);
    myBox.Add(hello);

    //Show Everything     
    myWin.ShowAll(); 
    Application.Run(); }
}

(********* Exercice 2 Question 1 
 Construire un délégué C# qui prenne en paramètres deux entiers, une fonction, et
qui applique cette fonction à ces deux entiers. 
*********)
using System;

	delegate int operation(int a,int b);

	
class Test {

	static int calcul(int a,int b,operation f){
		
		return f(a,b);
	}
	
	static int add(int a,int b) {
		return a+b;	
	}
	static int multi(int a,int b) {
		return a*b;	
	}

	public static void Main(string[] args) {
			
		operation op = multi;
		 
		System.Console.Write(Test.calcul(5,3,op));
		
        System.Console.ReadKey();
		}
	

	}

(********* Exercice 2 Question 2 
 Remplacer la fonction onClick par une fonction anonyme.
*********)

using System;
using Gtk;

public class GtkHelloWorld {
  static void onClick (object obj, EventArgs args) {
    Console.WriteLine("I have been clicked by a {0}", obj); }

  public static void Main() {
    Application.Init();
 
    //Create the Window
    Window myWin = new Window("Brave new world");
    myWin.Resize(200,200);
    HBox myBox = new HBox (false, 10);
    myWin.Add(myBox);

    // Set up a button object.
    Button hello = new Button ("Hello");
    hello.Clicked += new EventHandler((object obj,EventArgs args) =>{
	Console.WriteLine("I have been clicked by a {0}", obj);}
);
    myBox.Add(hello);

    //Show Everything     
    myWin.ShowAll(); 
    Application.Run(); }
}

(********* Exercice 2 Question 3 
 Écrire une application qui contient deux boutons, nommés ping et pong. Seul l’un des
deux boutons doit être actif à un instant donné (cf. la propriété Sensitive). Appuyer
sur un bouton le désactive et active le second.
*********)
using System;
using Gtk;

public class GtkHelloWorld {
  

  public static void Main() {
    Application.Init();
  
    //Create the Window
    Window myWin = new Window("Brave new world");
    myWin.Resize(200,200);
    HBox myBox = new HBox (false, 10);
    myWin.Add(myBox);

    // Set up a button object.
    Button ping = new Button ("ping");
    Button pong = new Button ("pong");
∕/ Appuie sur bouton ping 
	ping.Clicked +=new EventHandler( (object obj, EventArgs args )=> {
		pong.Sensitive=false; 	
// Desactivation bouton pong
});
		pong.Clicked +=new EventHandler( (object obj, EventArgs args )=> {
		ping.Sensitive=false; 	
});
    //hello.Clicked += new EventHandler(onClick);
    myBox.Add(ping);  
    myBox.Add(pong);
    


    //Show Everything     
    myWin.ShowAll(); 
    Application.Run(); }
}

 
(********* Exercice  3 question 1 
Écrire le code permettant d’afficher une liste d’entiers List<Integer> à l’aide de la
fonction forEach et d’une lambda-expression
 *********)
 
import java.util.Arrays;
import java.util.List;

class Functional {

    public static void main(String[] args) {
	List<Integer> lis   = Arrays.asList(7,4,666,9,41,5);
	// default void    forEach(Consumer<? super T> action)
	lis.forEach(System.out::println);
    };
}
 

(********* Exercice  3 question 2 
Où est définie la méthode forEach ?
Pourquoi est-elle marquée comme une méthode par défaut ?
 *********)
// la methode forEach est definie dans java.lang.Iterable
// Elle est marquee comme methode par defaut car comme ayant deja eu une definition si la classe de l'objet sur lequel la methode est appliquene redefinit pas la methode le code de la classe fille est utilise .

(********* Exercice  3 question 3 
Écrire le code permettant de trier une List<Integer> à l’aide d’une lambda-expression
et de la méthode sort de l’interface List.
 *********) 

// Tri tableau  de la liste



import java.util.LinkedList;
import java.util.List;

public class Exo3 {

	public static void main(String[] args){

	List<Integer> list=new LinkedList<Integer>();
	list.add(1);
	list.add(2);
	list.add(3);
	list.add(9);
	list.add(5);
	list.add(7);
	list.add(8);

	list.sort((a ,b) -> a.compareTo(b)  );
	
	list.forEach(System.out::println);
	

}
}
(********* Exercice  3 question 4 
Comment se comporte l’inférence de type pour les lambda-expressions ?
Quels sont les types des valeurs fonctionnelles ainsi créées ?
Comparer l’expressivité des lambdas-expressions Java à celles de C# et d’OCaml.
*********) 
 // on constate que l inference de type se fait de maniere tres implicite c'est le super type Object .
//

// On constate que le langage C# et java sont a peu pres au meme niveau d'expressivite et  que le langage ocaml est moins expressif du point de vue d'un programmeur classique .
(********* Exercice  3 question 5 
Quel problème est posé par la capture de variable locale ?
 *********) 
// Le probleme pose est a capture des variables se fait de manière automatique et nous n’avons pas le choix : elle se fait par référence. Cela veut dire que l’extérieur et l’intérieur de la lambda utilisent le même espace mémoire pour accéder à la variable.
