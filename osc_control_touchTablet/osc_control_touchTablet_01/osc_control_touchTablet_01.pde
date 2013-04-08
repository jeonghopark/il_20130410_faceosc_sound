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
}


//public void xyPos(float _x, float _y) {
//  xPos = _x;
//  yPos = _y;
//}


void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.isPlugged()==false) {
    println("UNPLUGGED: " + theOscMessage);
  }
}

