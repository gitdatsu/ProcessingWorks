// 20170618
// made by datchan

Points p;

void setup(){
  size(800,800);
  background(0);
  frameRate(60);
  smooth();
  noFill();
  p=new Points();
}

void draw(){
  background(0,50);
  p.draw();
}