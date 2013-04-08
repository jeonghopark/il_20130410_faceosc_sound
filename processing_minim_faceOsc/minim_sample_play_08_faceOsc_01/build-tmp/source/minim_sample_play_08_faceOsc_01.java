import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 
import oscP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class minim_sample_play_08_faceOsc_01 extends PApplet {


Minim minim;


OscP5 oscP5;

// AudioSample kick;
AudioPlayer loopSamp;

boolean mousePosD;
boolean soundTriggered;

PVector headPosition;
int found;
float noiseColorFactor;

public void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 8338);

  minim = new Minim(this);
  // kick = minim.loadSample("BD.mp3");
  loopSamp = minim.loadFile("drum_loop_short.wav");

  mousePosD = false;
  soundTriggered = false;

  headPosition = new PVector();
  found = 0;
  noiseColorFactor = 0;
}

public void draw() {
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

  // F\u00fcr nur einmal spielen
  if (mousePosD&&soundTriggered==true) {
    // kick.trigger();
    loopSamp.rewind();
    loopSamp.play();
    println("BANG");
  } 

  soundTriggered = oneTrigger(mousePosD);
}

public boolean oneTrigger(boolean _b)
{
  if (_b) return false;
  else return true;
}

public void oscEvent(OscMessage m) 
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


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "minim_sample_play_08_faceOsc_01" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
