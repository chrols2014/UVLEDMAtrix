class LEDObj {
  int brightness;
  int fadeRate=3; //rate at which leds loose light
  float xpos;
  float ypos;
  float elWidth= 60;
  float elHeight = 60;
  float a,b; //for collision check
  boolean touchState = false;
 int perimLimit = 20; //area around led, collision detection. 1

  LEDObj(int _brightness, float _xpos, float _ypos) {
    brightness = _brightness;
    xpos = _xpos;
    ypos = _ypos;
  } 

  void displayLEDs() {
  }



  void updateLED() {
    checkForTouch();
    
    fadeLED();
    
  }
  
  void checkForTouch(){
    float mouseX2 = constrain(mouseX,100,900);
    
    float mouseY2 = constrain(mouseY,100,900);
    
      a = sq( (mouseX2 - xpos)*2/elWidth );
      b = sq( (mouseY2 - ypos)*2/elHeight );
      if ((a + b) < perimLimit) {
      brightness =255;
      touchState = true;
      
      }
      else
      touchState = false;
      
     
     
    
  }
  
  
 void fadeLED(){
   if (touchState){
    //fullbrightness
    brightness = 255;
   }
  else
  
  brightness = brightness - fadeRate;
  
  brightness = constrain(brightness,0,255);
    
    
  }
  
}

