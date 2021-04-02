//processing sketch to parse sd card data from adalogger back to arduino

import processing.serial.*;

String serialData;

Serial myPort;  // Create object from Serial class
int val;   
float x,y,z, mx; 

void setup() 
{
  size(200, 200);
  println(myPort);  //replace with the thing that shows available comm ports
  String portName = Serial.list()[0]; //change to correct port
  myPort = new Serial(this, portName, 9600);
  //printArray(Serial.list());  //print available comm ports
  
   String[] serialData = loadStrings ("DATALOG.txt");
  String allData = join(serialData, " ");
  String [] tokens = splitTokens(allData, " ,.?!:;[]-\"'");
  

   mx = map(allData, 0, 3000, 0, 180);  //double check staring values, remapping for servo angle
//sending mx to ino, mx = val in ino 
}


void draw(){
 //myPort.write('mx');  //command to write to serial
// println(mx);
}
