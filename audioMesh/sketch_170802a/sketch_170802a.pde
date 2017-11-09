Triangle tri;

PVector pos;
float side;

void setup(){
  size(600,600);
  
  pos = new PVector(width/2,height/2);
  side = 100;
  
  PVector p1,p2,p3;
  p1 = new PVector(pos.x,pos.y);
  p2 = new PVector(pos.x,pos.y);
  p3 = new PVector(pos.x,pos.y);
  tri = new Triangle(p1,p2,p3);
}

void draw(){
  background(0);
  float t = millis()/1000.0;
  float cw = width/2.0;
  float ch = height/2.0;
  //update
  tri.setVertex(0,new PVector(cw+side*cos(t),ch+side*sin(t+sin(t))));
  tri.setVertex(1,new PVector(cw+side*cos(t*2.4),ch+side*sin(t+PI)));
  tri.setVertex(2,new PVector(cw+side*cos(t+PI/2),ch+side*sin(t*3.8)));
  
  
  //draw
  strokeWeight(10);
  point(pos.x,pos.y);
  tri.draw();
}