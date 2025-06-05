#include <Servo.h>

Servo myservo;   //转头
Servo myservo1;  //右大臂
Servo myservo2;  //左小臂

int currentValue = 0;
int pos[] = {0,0};
int angle;
float pos2;

void setup() {
  Serial.begin(9600);
  myservo.attach(11); //转头
  myservo1.attach(9); //右大臂
  myservo2.attach(6); //左小臂
  myservo2.write(30);//先调整这个位置，在临界点，
  myservo1.write(180);
}

void loop() {
  
  while(Serial.available()>0){
    int incomingValue = Serial.read();
    
    pos[currentValue] = incomingValue;

    currentValue++;
    if(currentValue > 1){
      currentValue = 0;
    }

    pos2=330-5*pos[0]/3+0.3;
    angle = int((constrain(pos2,30,180)));

      myservo1.write(pos[0]);
      myservo2.write(angle);
      myservo.write(pos[1]);
     
  }
}
