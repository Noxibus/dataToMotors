import processing.serial.*;
Serial myPort; 

void setupSerial() {

  String portName = Serial.list()[3]; //change to correct port
  myPort = new Serial(this, portName, 9600);
   printArray(Serial.list());  //print available comm ports
}
