using System;
using System.Collections.Generic;
using System.Linq;

class Program {

private static List<string> people =new List<string>(){
"Robert", "Roger", "Raymond", "Remi",
"Radicowl", "Ross", "Rififi", "Rossinante"};

	/*
public static B Fold<A,B>(Func<B,A,B> f,B init,IEnumerable<A> l ){
	B acc=init;
	foreach(A a in l){
		acc=f(acc,a);


}
	return  acc ;
}
	*/

public static B Fold<A,B>(Func<B,A,B> f,B acc,IEnumerator<A> l ){
	if (l.MoveNext())
	{
		return (Fold<A,B>(f,f(acc,l.Current),l));
	}
	else {
		return acc;
	}
}

public static void Main() {
IEnumerable<string> people1 = from p in people select p;
IEnumerable<string> query = from p in people  where p.Length>5 orderby p descending select p ;

//IEnumerable<string> queryM = people.Where(p => p.Length>5 ).OrderByDescending(p=>p);
int count = query.Aggregate(0 , (acc , list) => 1+acc);

		string result = Fold<string,string>((current, next) => current+next ,"",query.GetEnumerator());
Console.WriteLine(" Concatenate with Fold "+result);
/*foreach (string person in queryM)
//Console.WriteLine(person);
*/
}

}


// Exercice 2 / Question 3  - C'est de la programmtion fonctionnelle . 

//le style est verbeux 




