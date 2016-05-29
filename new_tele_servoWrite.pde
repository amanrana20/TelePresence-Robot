import org.firmata.*;
import cc.arduino.*;
import processing.serial.*;

Arduino arduino;

int neck_pin = 6, face_pin = 9, shoulder1_pin = 10, shoulder2_pin = 11;
int neck_value = 0, face_value = 0, shoulder1_value = 0, shoulder2_value = 0; 

int calc(int a)
{
  if( a == 1)
    return 60;
  if(a == 2)
    return 90;
  if(a == 3)
    return 120;
  
  return 90;
 
}

int calc2(int a)
{
  if( a == 1)
    return 0;
  if(a == 2)
    return 60;
  if(a == 3)
    return 150;
  
  return 60; 
}
void setup()
{
  size(100, 100);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(neck_pin, Arduino.SERVO);
  arduino.pinMode(face_pin, Arduino.SERVO);
  arduino.pinMode(shoulder1_pin, Arduino.SERVO);
  arduino.pinMode(shoulder2_pin, Arduino.SERVO);
}

void draw()
{
  String[] data = loadStrings("/home/ankit/remote_pastedir/finally");
  if (data != null)
  {
    neck_value = calc(int(data[0]));
    face_value = calc(int(data[1]));
    shoulder1_value = calc2(int(data[2]));
    shoulder2_value = calc2(int(data[3]));
    
    arduino.servoWrite(neck_pin,neck_value);
    arduino.servoWrite(face_pin,face_value);
    arduino.servoWrite(shoulder1_pin,(shoulder1_value));
    arduino.servoWrite(shoulder2_pin,(180-shoulder2_value));
    delay(10);
    /*
    println(neck_value);
    println(face_value);
    println(shoulder1_value);
    println(shoulder2_value);
    println("-----------------------");*/
    
  }
}


