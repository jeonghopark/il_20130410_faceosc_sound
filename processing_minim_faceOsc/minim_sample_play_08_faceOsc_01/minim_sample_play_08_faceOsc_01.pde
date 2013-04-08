import ddf.minim.*;
Minim minim;

import oscP5.*;
OscP5 oscP5;

AudioPlayer loopSamp;

boolean mousePosD;
boolean soundTriggered;

PVector headPosition;
int found;
float noiseColorFactor;

void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);
  minim = new Minim(this);
  loopSamp = minim.loadFile("drum_loop_short.wav");

  mousePosD = false;
  soundTriggered = false;

  headPosition = new PVector();
  found = 0;
  noiseColorFactor = 0;
}

void draw() {
  background(255);

  fill(255);
  textSize(28);
  text("Play Area", 100, height/2);
  
  if (found==1) {
    if ((headPosition.x < width/2)) {
      mousePosD = true;
      fill(0, 180, 180);
    }
    else {
      mousePosD = false;
      fill(255);
    }

    rect(0, 0, width/2, height);

    fill(0,255,0);
    rect(headPosition.x,height/2, 20, 20);
  }

  // Für nur einmal spielen
  if (mousePosD&&soundTriggered==true) {
    loopSamp.rewind();
    loopSamp.play();
    println("BANG");
  } 

  soundTriggered = oneTrigger(mousePosD);
}

boolean oneTrigger(boolean _b)
{
  if (_b) return false;
  else return true;
}

void oscEvent(OscMessage m) 
{
  if (m.checkAddrPattern("/found"))
  {
    found = m.get(0).intValue();
  }

  if (m.checkAddrPattern("/pose/position")) 
  {
    headPosition.x = m.get(0).floatValue()*-1+width;
    headPosition.y = m.get(1).floatValue();
    println("x : " + headPosition.x);
    println("y : " + headPosition.y);
  }
}


