int num;
PVector[] pos;
PVector[] ppos;
float[] radian;
float radius;
float step;

int imgNum;

void setup(){
  size(1920,1080,P3D);
  background(0);
  frameRate(120);
  blendMode(ADD);
  
  num = 5;
  pos = new PVector[num];
  ppos = new PVector[num];
  radian = new float[num];
  for(int i=0;i<num;i++){
    pos[i] = new PVector(0,0);
    ppos[i] = new PVector(0,0);
    radian[i] = i*2.0*PI/num;
  }
  
  radius=0;
  step = 2;
  
  imgNum=0;
}

void draw(){
  /*
  blendMode(BLEND);
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  */
  pushMatrix();
  translate(width/2,height/2);
  scale(1,-1);
  blendMode(ADD);
  stroke(10,40,200);
  strokeWeight(3);
  for(int i=0;i<num;i++){
    radian[i]+=PI/180;
    pos[i].x = radius * cos(radian[i]);
    pos[i].y = radius * sin(radian[i]);
    line(ppos[i].x,ppos[i].y,pos[i].x,pos[i].y);
    //point(pos[i].x,pos[i].y);
    ppos[i].set(pos[i]);
  }
  popMatrix();
  radius = (height/2) * (sin(frameCount/60.0));// * cos(frameCount/30.0));
}

void keyPressed(){
  if(key == 's'){
    imgNum++;
    save("img"+month()+day()+hour()+minute()+second()+".png");
  }
}