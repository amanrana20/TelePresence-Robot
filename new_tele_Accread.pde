import org.firmata.*;
import cc.arduino.*;
import processing.serial.*;

Arduino arduino;

int neckX_value = 0, faceY_value = 0, shoulder1Y_value = 0, shoulder2Y_value = 0;
int neckX_pin = 0, faceY_pin = 1, shoulder1Y_pin = 2, shoulder2Y_pin = 3;

String calc(int a)
{
  if( a>= 60 && a < 80)
    return "1";
  if( a>= 80 && a < 100)
    return "2";
  if( a>= 100 && a <= 120)
    return "3";
    
  return "0";
}

void setup()
{
  size(100, 100);
  arduino = new Arduino(this, Arduino.list()[32], 57600);
}

void draw()
{
  int[] data = new int[4];
  String[] dataWrite = new String[4];
  neckX_value = arduino.analogRead(neckX_pin);
  faceY_value = arduino.analogRead(faceY_pin);
  shoulder1Y_value = arduino.analogRead(shoulder1Y_pin);
  shoulder2Y_value = arduino.analogRead(shoulder2Y_pin);

  if ( neckX_value > 420 )
    neckX_value = 420;
  if ( neckX_value < 260 )
    neckX_value = 260;

  if ( faceY_value > 420 )
    faceY_value = 420;
  if ( faceY_value < 260 )
    faceY_value = 260;

  if ( shoulder1Y_value > 630)
    shoulder1Y_value = 630;
  if ( shoulder1Y_value < 380)
    shoulder1Y_value = 380;

  if ( shoulder2Y_value > 420 )
    shoulder2Y_value = 420;
  if ( shoulder2Y_value < 260 )
    shoulder2Y_value = 260;

  data[0] = int(map(neckX_value, 260, 420, 60, 120));
  data[1] = int(map(faceY_value, 260, 420, 60, 120));
  data[2] = int(map(shoulder1Y_value, 380, 630, 60, 120));
  data[3] = int(map(shoulder2Y_value, 260, 420, 60, 120));
  
  dataWrite[0] = calc(data[0]);
  dataWrite[1] = calc(data[1]);
  dataWrite[2] = calc(data[2]);
  dataWrite[3] = calc(data[3]);
  
  saveStrings("/home/akhilesh/remote_copydir/finally",dataWrite);

  println(data[0]);
  println(data[1]);
  println(data[2]);
  println(data[3]);
  println();
  println(dataWrite[0]);
  println(dataWrite[1]);
  println(dataWrite[2]);
  println(dataWrite[3]);
  println("-------------------------------------");
  delay(100);
}

