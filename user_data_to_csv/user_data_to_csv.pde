//processing sketch to parse sd card data from adalogger back to arduino
float[] vals;
float min = 0; //what is the min 
float max = 2000; //and max of your data readings?
int i=0;
int timer =0; 
int timerDelay= 1000;//1000 millisenconds/ 1 second. 
int total=0;


ArrayList data = new ArrayList();
//maybe I have to convert this to just a plain array
//or maybe a hashmap idk

// Create object from Serial class
int val;   
float valx; 

void setup() 
{
  size(200, 200);


  String[] serialData = loadStrings ("DATALOG.txt");
  for (int i = 0; i < serialData.length; i++) {  
     float val [] = float(serialData[i].split(","));
    //float val [] = float(serialData[i].split(", "));
   //  println(val);
  }

  
}


void draw() {

  readTxt();
  background(0);
  //map data to 0-180 for motor movement
  float pos = map(val, min, max, 0, 180);  //why am I only getting 0's printed
  println(pos);
  fill(255);
  text(pos, width/2, height/2);

  //constrain for the motor movement incase we have data over or under min and max. 
  float cPos = constrain(pos, 0, 180);
  //myPort.write(int(cPos));  //command to write to serial. Must be int or byte.
}

void readTxt() {
  // delay update of new data and reset timer
  //if millis counter is greater than our timer...
  if (millis() >= timer) {
    //timer = current millis counter + our timerDelay
    timer = millis() + timerDelay;
    // increment through data
    i++;

    //  check to see if at end of data
    if (i == total) {
      i = 0;//if so, loop back to first row
    }
  }
}
