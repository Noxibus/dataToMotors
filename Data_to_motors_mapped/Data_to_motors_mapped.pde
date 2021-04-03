import processing.serial.*;
float vals[];
Serial myPort; 

void setup() {
  size(200, 200);
   String portName = Serial.list()[3]; //change to correct port
  myPort = new Serial(this, portName, 9600);
  
  String[] serialData = loadStrings ("DATALOG.txt");
 // printArray(serialData);  //one big line, need to split
  String valsString [] = splitTokens(serialData[0], ", ");  //splitting array
  //printArray(valsString);

  for (int i=0; i<valsString.length; i++) {
    float val = float(valsString[i]);
   //println(valx);
  }
  vals = new float[valsString.length]; // create an array of same length as source data
  for (int i = 0; i < valsString.length; i++) {  // Step throught the array of Strings
  
    //vals[i] = float(valsString[i]); 
        vals[i] = map(float(valsString[i]), 0, 3000, 0, 180); 
        
  }

  printArray(vals);
 //byte valx = vals;
 printArray(Serial.list());
}

void draw() {
 myPort.write(vals);  //this is wanting my string info in bytes
}
