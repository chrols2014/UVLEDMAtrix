class LEDMatrix {
  int distance = 125;  //between points in either direction
  int wideCount = 4;  //number of leds
  int hightCount = 4;
  int brightness;  //global matrix setting
  float xpos;   //not required
  float ypos;
  int numberOfLEDs=16;   //total number of LEDs in matrix.
  LEDObj[] LEDs;     //array containing LEDobjs


    //constructor
  LEDMatrix(int _numberOfLEDs) {
    numberOfLEDs = _numberOfLEDs;

    LEDs = new LEDObj[numberOfLEDs];

    //Create LED Objects in Matrix
    float xgap = width /5; //set grid
    float ygap = height /5;
    // for (int i3 = 0; i3 <= numberOfLEDs; i3++){

    int index = 0;
    for (int i = 1; i <= 4; i++) {
      for (int i2 = 1; i2 <=4; i2++) {
        stroke(255);
        //line(i*xgap,i*ygap,width,height);

        LEDs[index++] = new LEDObj(int(random(255)), i*xgap, i2*ygap);
        ellipse(i*xgap, i2*ygap, 20, 20);
      }
    }  


    // }
  }

  void displayLEDs() {

    for (int i = 0; i <= LEDs.length-1; i++) {
      fill(0,0,LEDs[i].brightness);
      noStroke();
      ellipse(LEDs[i].xpos, LEDs[i].ypos, LEDs[i].elWidth, LEDs[i].elHeight); 
      // print("Loop"+i);
      //println(LEDs[i].xpos);
    }
  }



  void updateLEDs() {
    for (int i = 0; i <= numberOfLEDs-1;i++){
     LEDs[i].updateLED(); 
      
    }
  }


  void createLEDXYLoc(int _points) {

    float xgap = width /5;
    float ygap = height /5;

    for (int i = 1; i <= 4; i++) {
      for (int i2 = 1; i2 <=4; i2++) {
        stroke(255);
        //line(i*xgap,i*ygap,width,height);


        ellipse(i*xgap, i2*ygap, 20, 20);
      }
    }
  }
}

