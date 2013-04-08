// http://code.compartmental.net/tools/minim/manual-audiosnippet/
// http://code.compartmental.net/minim-beta/javadoc/

import ddf.minim.*;
Minim minim;

AudioPlayer loopSamp;

boolean mousePosD;
boolean soundTriggered;

void setup() 
{
  size(640, 480);
  frameRate(30);

  minim = new Minim(this);
  loopSamp = minim.loadFile("drum_loop_short.wav");
}

void draw() {
  background(120);

  if (mouseX < width/2) 
  {
    fill(0, 180, 180);
  } 
  else {
    fill(120, 120, 120);
  }
  rect(0, 0, width/2, height);
}

void keyPressed()
{
  if (key==' ') {
    loopSamp.rewind();
    loopSamp.play();
  }
}

