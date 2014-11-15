import processing.serial.*;

//Chris Olsen, 2014
//UVLED Tonic Water Interface Model


LEDMatrix UVLEDs;

Serial serialPort;
String nameOfPortToFind = "tty.usbmodem";
int timeBetweenSerialUpdates = 50;
int startTime =0;
void setup(){
  serialPort = findPortName(nameOfPortToFind);
size(1000,1000);
//calculateLEDPoints
UVLEDs = new LEDMatrix(16);  
smooth();
frameRate(100);
  
}



void draw(){
  background(0);
 // drawGrid(16);
  UVLEDs.updateLEDs();
  UVLEDs.displayLEDs();
  sendComms();
}



void sendComms(){
 //send data to arduino
// alpha - represent number of led 0-15
//number 0-255, 
if (millis() >= startTime + timeBetweenSerialUpdates) {


    serialPort.write("<");
    for (int i = 0; i <= UVLEDs.numberOfLEDs-1;i++){
      serialPort.write(UVLEDs.LEDs[i].brightness + ",");
      
    }
  serialPort.write(">");
   startTime = millis();
}

}


////////Function to find port name so manual selection isn't required.
Serial findPortName(String _nameOfPortToFind) {
  boolean found = false;
  int numberOfPorts = Serial.list().length;  //find how many ports you have
  String[] arrayOfPorts = new String[numberOfPorts];  //container for port names  
  Serial tempPortName = null;

  //Store list of ports in a new array
  for (int i= 0; i <= numberOfPorts-1; i++) {
    arrayOfPorts[i] = Serial.list()[i];
  }


  //Search within each entry of the array to look for HackerDock port (usbmodem)

  for (int i = 0; i <= arrayOfPorts.length-1; i++) {

    if (match(arrayOfPorts[i], _nameOfPortToFind) != null) {
      String incomingPortName = arrayOfPorts[i];
      tempPortName = new Serial(this, incomingPortName, 9600);
      found = true;
    }
  }

  // report back if found and return serial datatype to setup
  if (found == true) {
    println("Arduino Detected");
 //   dockDetected = true;
    return(tempPortName);
  } else {

    println("No Arduino Found!");  
      //dockDetected = false;
    return(null);
  }
}

void serialEvent(Serial p) { 
  print(p.readString()); 
} 

