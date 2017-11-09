import processing.opengl.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput in;

float[][] wave;
int waveW;
int waveD;
int BufferSize;

void setup(){
  size(800,800,OPENGL);
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,512);
  
  BufferSize = in.bufferSize();
  waveW = 100;
  waveD = 200;
  wave = new float[waveW][waveD];
  
}

void draw(){
  background(0);

  pushMatrix();
  
  // camera setting
  float camR = 10+mouseY;
  float camTheta = PI*(mouseX-width/2.0)/(width/2.0);
  //camTheta = 0;
  float camX = camR * cos(camTheta);
  float camZ = camR * sin(camTheta);
  perspective(radians(60),float(width)/float(height), 1.0, 600);
  camera(camX, -10, camZ,
         0.0, 0.0, 0.0,
         0.0, 1.0, 0.0);
  
  // update
  // update 
  for(int i=waveD-1;i>=0;i--){
    for(int j=waveW-1;j>=0;j--){
      if(i!=0) wave[j][i] = wave[j][i-1];
      else wave[j][i] = in.left.get(j*floor(BufferSize/waveD));// get new data
    }
  }
  // draw
  stroke(255);
  strokeWeight(1);
  noFill();
  box(100);
  strokeWeight(1);
  //translate(width/2.0,height/2.0);
  for(int i=0;i<waveD;i++){
    for(int j=0;j<waveW;j++){
        point(waveD/2.0-i,500*wave[j][i],waveW/2.0-j);      
    }
  }
  popMatrix();
}

void stop(){
  in.close();
  minim.stop();
  super.stop();
}