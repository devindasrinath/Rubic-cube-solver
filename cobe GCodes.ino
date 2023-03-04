#include <AccelStepper.h>
// Define stepper motor connections and motor interface type. Motor interface type must be set to 1 when using a driver:
#define dirPin1 7
#define stepPin1 4
#define dirPin2 5
#define stepPin2 2
#define dirPin3 6
#define stepPin3 3
#define dirPin4 13
#define stepPin4 12
#define motorInterfaceType 1

#include "FastLED.h"
 
// How many leds in your strip?
#define NUM_LEDS 7
 
#define DATA_PIN 9

 
CRGB leds[NUM_LEDS];
 
// Create a new instance of the AccelStepper class:
AccelStepper stepper1 = AccelStepper(motorInterfaceType, stepPin1, dirPin1);
AccelStepper stepper2 = AccelStepper(motorInterfaceType, stepPin2, dirPin2);
AccelStepper stepper3 = AccelStepper(motorInterfaceType, stepPin3, dirPin3);
AccelStepper stepper4 = AccelStepper(motorInterfaceType, stepPin4, dirPin4);
int current_side=1;
int side=1;
int rotations_to_target=0;
//int placements[]={4, 2, 4,2,3,1,4};

//int algo[6][2]={{1,-1},{2,1},{3,-1},{4,1},{5,1},{6,1}};
//int algo[6][2]={{1,1},{0,0},{0,0},{0,0},{0,0},{0,0}};
//int algo[362][2]={
//  {2,-1},{3,1},{5,1},{5,1},{2,-1},{5,-1},{5,-1},{1,-1},{5,1},{5,1},{5,1},{2,1},{5,1},{5,1},{1,1},{1,1},{5,1},{2,1},{2,1},{5,1},{5,1},{3,1},{3,1},{5,1},{4,1},{4,1},{5,-1},{4,1},{5,1},
//  {4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{5,-1},{1,1},{5,1},{1,-1},{5,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},
//  {5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},
//  {5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1}
//  ,{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},
//  {5,-1},{4,1},{5,1},{4,-1},{5,-1},{5,-1},{5,-1},{5,-1},{5,-1},{3,-1},{5,-1},{3,1},{5,1},{4,1},{5,1},{4,-1},{5,-1},{5,-1},{5,-1},{4,-1},{5,-1},{4,1},{5,1},{1,1},{5,1},{1,-1},{5,-1},
//  {5,-1},{5,1},{3,1},{5,1},{3,-1},{5,-1},{2,-1},{5,-1},{2,1},{5,1},{5,1},{2,1},{5,1},{2,-1},{5,-1},{1,-1},{5,-1},{1,1},{5,1},{5,-1},{5,-1},{5,-1},{5,1},{2,1},{5,1},{2,-1},{5,-1},
//  {1,-1},{5,-1},{1,1},{5,1},{2,1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{2,-1},{5,-1},{5,-1},{4,1},{6,-1},{4,-1},{6,1},{4,1},{6,-1},{4,-1},{6,1},{5,-1},{5,-1},{5,-1},
//  {4,1},{6,-1},{4,-1},{6,1},{4,1},{6,-1},{4,-1},{6,1},{4,1},{6,-1},{4,-1},{6,1},{4,1},{6,-1},{4,-1},{6,1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{4,-1},{5,-1},{4,1},{5,1},{2,1},{5,1},{2,-1},
//  {5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{2,1},{5,1},{2,-1},{5,-1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},
//  {5,1},{4,-1},{5,-1},{4,1},{5,1},{4,-1},{5,-1},{4,1},{5,1},{1,1},{5,1},{1,-1},{5,-1},{3,-1},{5,-1},{3,1},{5,1},{1,1},{5,1},{1,-1},{5,-1},{1,1},{5,1},{1,-1},{5,-1},{1,1},{5,1},{1,-1},
//  {5,-1},{1,1},{5,1},{1,-1},{5,-1},{1,1},{5,1},{1,-1},{5,-1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},{5,1},{3,-1},{5,-1},{3,1},
//  {5,1}
//};

int colours[8][3]={{0,255,0},{255,0,0},{128,255,0},{0,0,255},{255,255,0},{255,255,255},{0,255,128},{204,0,204}};
void setup() {
   FastLED.addLeds<WS2812B, DATA_PIN, RGB>(leds, NUM_LEDS);
  
  // put your setup code here, to run once:
   stepper1.setMaxSpeed(2000*4);
   stepper2.setMaxSpeed(2000*4);
   stepper3.setMaxSpeed(2000*4);
   stepper4.setMaxSpeed(2000*4);
  //stepper.setAcceleration(100*4);
 pinMode(10,OUTPUT);
//  pinMode(A2,OUTPUT);
//  pinMode(38,OUTPUT);
  pinMode(8,OUTPUT);
//  digitalWrite(30,LOW);
//  digitalWrite(A2,LOW);
//  digitalWrite(38,LOW);
  digitalWrite(8,LOW);
  stepper1.setCurrentPosition(0);
  stepper2.setCurrentPosition(0);
  stepper3.setCurrentPosition(0);
  stepper4.setCurrentPosition(0);
  stepper1.stop();
  stepper2.stop();
  stepper3.stop();
  stepper4.stop();
  Serial.begin(250000);
  


Serial.println("ready");

}
bool End=false;
void loop() {
while (Serial.available() > 0 && End==false) {

    // look for the next valid integer in the incoming serial stream:
    int s = Serial.parseInt();
    // do it again:
    int d = Serial.parseInt();
   
   
 FastLED.clear ();
 if(s==7  && d==0){
  End=true;
 }
 else{
 leds[7-s] = CRGB(colours[s-1][0], colours[s-1][1], colours[s-1][2]);
  int directioncolour=((d+1)/2)+6;
leds[0] = CRGB(colours[directioncolour][0], colours[directioncolour][1], colours[directioncolour][2]);
FastLED.show();
if(s<5){
  
placement(s);
MainsideRotate(d);
}
else{
  sideRotate(s,d);
  }

//}
Serial.println("done");
 }
if (Serial.read() == '\n') {
  break;
}
}
if(End==true){
  endState();
}

}

void placement(int side){
  
rotations_to_target=side-current_side;
current_side+=rotations_to_target;
 stepper1.setCurrentPosition(0);
 stepper2.setCurrentPosition(0);
  // Run the motor forward at 200 steps/second until the motor reaches 400 steps (2 revolutions):
  int direction1;
  if( rotations_to_target<0){
    direction1=-1;
  }
 if( rotations_to_target>0){
    direction1=+1;
  }
  bool lockstate=true;
  if(rotations_to_target!=0){

    lock(-1);
    lockstate=false;
  }
  while(stepper1.currentPosition() != 50*4*(-rotations_to_target) || stepper2.currentPosition() != 50*4*rotations_to_target )
  {
 if(stepper1.currentPosition() != 50*4*(-rotations_to_target)){
    stepper1.setSpeed((-direction1)*1000*4); 
    stepper1.runSpeed(); }
    else{stepper1.currentPosition() != 50*4*(-rotations_to_target);
    }
   if(stepper2.currentPosition() != 50*4*(rotations_to_target)){
    stepper2.setSpeed((direction1)*1000*4); 
    stepper2.runSpeed(); }
    else{stepper1.currentPosition() != 50*4*(rotations_to_target);
    }   
  }
  stepper1.stop();
  stepper2.stop();
  
 // delay(100);
if(lockstate==false){
  lock(1);
}
  
}


void MainsideRotate(int direction2){
  
 stepper3.setCurrentPosition(0);
  while(stepper3.currentPosition() != (-direction2)*50*4 ){
    stepper3.setSpeed((-direction2)*800*4); //800
    stepper3.runSpeed(); 
  
  }
  stepper3.stop();

  delay(10);
}

void lock(int lockState){
  
  stepper4.setCurrentPosition(0);
while(stepper4.currentPosition() != 600*4 *(-lockState)){
   stepper4.setSpeed((-lockState)*800*4); 
   stepper4.runSpeed(); 
 }
 stepper4.stop();

  delay(50);

}


void sideRotate(int side1,int direction3){
  if(side1==5){
 stepper1.setCurrentPosition(0);
  while(stepper1.currentPosition() != (-direction3)*50*4 ){
    stepper1.setSpeed((-direction3)*1000*4); //800
    stepper1.runSpeed(); 
  
  }
  stepper1.stop();
  }
  else if(side1==6){
    Serial.println("aass");
 stepper2.setCurrentPosition(0);
  while(stepper2.currentPosition() != (direction3)*50*4 ){
    stepper2.setSpeed((direction3)*1000*4); //800
    stepper2.runSpeed(); 
  
  }
  stepper2.stop();
  }
  delay(10);
}
