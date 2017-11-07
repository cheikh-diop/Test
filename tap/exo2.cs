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
