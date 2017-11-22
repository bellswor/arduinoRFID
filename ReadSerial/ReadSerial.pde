import processing.serial.*;

Serial myPort;
String val;
String test;
int active = 0;

void setup() {
  // the port to recieve from, this will be 0 or 1 or 2
  String portName = Serial.list()[1]; // 0, 1 or 2 depending on port
  myPort = new Serial(this, portName, 115200);
}

void draw () {
  
  if (myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
    if (val != null) {
      String rfidData = trim(val); 
      println(rfidData); 
      if (rfidData.equals("0xEA 0xE8 0x61 0xAA")) {
        if (active != 1){
          println("OMG");
          link("https://www.theatlantic.com/");
          active = 1;
        }  
      } else if(rfidData.equals("0xBA 0xEE 0x61 0xAA")) {
        if (active != 2){
          println("KIKKO");
          active = 2;
        }
      
      } else {
                println("fail");
      }
    }
  }
}

void mousePressed(){

  launch("/Users/benellsworth/Documents/CCS Classes/Fall 2017/Experience/Project 2/Final/Will Website/index.html");
}