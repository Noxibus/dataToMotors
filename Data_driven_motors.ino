
#include <Servo.h>

#include <Arduino_LSM9DS1.h>

Servo myservo1;  
Servo myservo2;

int pos = 0;   

void setup() {
   //myservo1.attach(12);
   myservo2.attach(9);  
 //  myservo3.attach(10);

 while (!Serial);

  if (!IMU.begin()) {
    Serial.println("Failed to initialize IMU!");
  myservo1.attach(12);  //why is this creating an error
    while (1);
  }

  Serial.print("Accelerometer sample rate = ");
  Serial.print(IMU.accelerationSampleRate());
  Serial.println(" Hz");
  Serial.println();
  Serial.println("Acceleration in G's");
  Serial.println("X\tY\tZ");
}

void loop() {

  float x,y,z;

  if (IMU.accelerationAvailable()) {
    IMU.readAcceleration(x, y, z);

    Serial.print(x);
   
  }
  for (pos = 0; pos <= 180; pos += 1) { 
    // in steps of 1 degree
    myservo1.write(pos);              
    delay(5);                       
  }
  for (pos = 180; pos >= 0; pos -= 1) { 
    myservo1.write(pos);             
    delay(15);                       
  }

  for (pos = 0; pos <= 90; pos += 1) { 
    // in steps of 1 degree
    myservo2.write(pos);              
    delay(5);                       
  }
  for (pos = 90; pos >= 0; pos -= 1) { 
    myservo2.write(pos);        
    delay(                                   5);                       
  }

//  for (pos = 0; pos <= 1; pos += 1) { 
//    // in steps of 1 degree
//    myservo3.write(pos);             
//    delay(15);                       
//  for (pos = 45; pos >= 0; pos -= 1) {
//    myservo3.write(pos);             
//    delay(15);                       
 // }
}
