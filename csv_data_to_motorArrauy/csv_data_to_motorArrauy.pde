//processing sketch to parse sd card data from adalogger back to arduino

import processing.serial.*;

ArrayList data = new ArrayList();
//maybe I have to convert this to just a plain array
//or maybe a hashmap idk

Serial myPort;  // Create object from Serial class
int val;   
float valx; 

void setup() 
{
  size(200, 200);
  println(myPort);  //replace with the thing that shows available comm ports
  //String portName = Serial.list()[0]; //change to correct port
  //myPort = new Serial(this, portName, 9600);
  //printArray(Serial.list());  //print available comm ports
  
   String[] serialData = loadStrings ("DATALOG.txt");
for (int i = 0; i < serialData.length; i++){  //I think this line is the problem 
//when i is equal to 0, less than the length of the data file, iterate through file
// float val [] = float(serialData[i].split(","));
 float val [] = float(serialData[i].split(", "));
 
}
  
   valx = map(val, 0, 2000, 0, 180);  //double check staring values, remapping for servo angle
//why is this only printing 0 and not the other numbers 
}


void draw(){
 //myPort.write('valx');  //command to write to serial
 println(valx);
}
