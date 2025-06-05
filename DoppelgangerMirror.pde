import oscP5.*;
OscP5 oscP5;
import processing.serial.*;
Serial port;

Face face = new Face();
ArrayList<Graph> graphs;
int totalGraphs;
int[] pos = new int[2];
String str;

void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);
  port = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  
  totalGraphs = 12;
  reset();

}

void reset() {
  graphs = new ArrayList<Graph>();
    graphs.add(new Graph("face.poseScale"));
    graphs.add(new Graph("face.poseOrientation.y"));
}

void draw() {
  if(face.found > 0) {
    graphs.get(0).add(face.poseScale);
    graphs.get(0).add(face.poseOrientation.y);
  }

  float pos1;
  pos1 = map(face.poseScale,2.8,6,180,90);
  pos[0]= floor(constrain(pos1,90,180));//base
  
  float pos2;
  pos2 = map(face.poseOrientation.y,-0.34,0.34,180,0);//turn
  pos[1]= floor(pos2);
  
  byte out[] = new byte[2];
  
  out[0]= byte(pos[0]);//base
  out[1]= byte(pos[1]);//turn
  
  println(pos);
  port.write(out);
}

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}