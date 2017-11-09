Easing easing;
Rect r;

float offsetLeft;
float offsetTop;

void setup(){
  size(512,512);
  rectMode(CENTER);
  
  r = new Rect();

  offsetLeft = r.r.x/2.0;
  offsetTop = r.r.y/2.0;
  
  easing = new Easing();
  easing.set(-width/2.0,width/2.0,1.0);
}

void draw(){
  background(0);
  
  r.pos.x = easing.getValue();
  r.r.x = (width-abs(r.pos.x*2.0));
  r.r.y = (width-abs(r.pos.x*2.0));
  
  pushMatrix();
  translate(width/2.0,height/2.0);
  scale(1, -1);
  r.draw();
  popMatrix();
}

void keyPressed(){
  easing.set(-width/2.0,width/2.0,1.0);
}