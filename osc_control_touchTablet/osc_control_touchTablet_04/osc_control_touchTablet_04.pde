// http://charlie-roberts.com/Control/

import oscP5.*;

OscP5 oscP5;

int xCord;
int yCord;
int xP;
int yP;

PVector xyData;
float xPos, yPos;


void setup() {
  size(400, 400);
  oscP5 = new OscP5(this, 8000);

  // set port address ("variable", "input address")
  oscP5.plug(this, "xyPos", "/multi/1");
}

void draw()
{
  background(0);
  fill(120);
  xPos = map(xPos,0,1,0,width);
  yPos = map(yPos,0,1,0,width);
  rect(xPos, yPos, 20, 20);
  println("Input X Signal  : " + xPos);
  println("OutPut X Signal : " + map(xPos,0,1,0,width));
  println("Input Y Signal : " + yPos);
  println("OutPut Y Signal : " + map(yPos,0,1,0,height));
}


public void xyPos(float _x, float _y) {
  xPos = _x;
  yPos = _y;
}


void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    println("UNPLUGGED: " + theOscMessage);
  }
}

