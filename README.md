Expressive_TelePresence_Robot
=============================

We intend to build an expressive telepresence robot. The project is motivated by the inability of the telepresence robots, available in the market, to express non-verbal cues of communication which represent two-third of all communication. 

The video of the robot can be found here:-  http://youtu.be/ZR1_WQ2fy4Q

We have setup lsyncd to communicate with the robot over the internet. Processing IDE and Arduino board is used for reading accelerometer values and controlling the robot.

The code in "new_tele_Accread" reads values from 3 accelerometers, maps them on a scale of 60 to 120, and then writes the following values in a text file - 
1 for value between 60 to 80,
2 for value between 80 to 100,
3 for value between 100 to 120.

The lsyncd syncs the text file to server automatically. 

On the server, the code in "new_tele_servoWrite" reads the text file. and moves the servo motor to the following angles - 
For neck:- 
  60 for value 1,
  90 for value 2,
  120 for value 3. and, 
For shoulders:-
  0 for value 1,
  60 for value 2,
  150 for value 3.
