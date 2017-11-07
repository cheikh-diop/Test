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
	ping.Clicked +=new EventHandler( (object obj, EventArgs args )=> {
		pong.Sensitive=false; 	
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
