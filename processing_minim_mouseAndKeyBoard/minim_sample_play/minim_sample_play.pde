// http://code.compartmental.net/minim-beta/javadoc/

import ddf.minim.*;
Minim minim;

// AudioSample kick;
AudioPlayer loopSamp;

boolean mousePosD;
boolean soundTriggered;

void setup() {
  size(640, 480);
  frameRate(30);

  minim = new Minim(this);
  // kick = minim.loadSample("BD.mp3");
  loopSamp = minim.loadFile("drum_loop_short.wav");

  mousePosD = false;
  soundTriggered = false;
}

void draw() {
  background(255);

  fill(255);
  textSize(28);
  text("Play Area", 100, height/2);

  if ((mouseX < width/2)) {
    mousePosD = true;
    fill(0, 180, 180);
  }
  else {
    mousePosD = false;
    fill(255);
  }

  rect(0, 0, width/2, height);

  // Für nur einmal spielen
  if (mousePosD&&soundTriggered==true) {
    // kick.trigger();
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

