int N = 5;
ArrayList<Box> boxs;
float R = 400;

void setup(){
  size(800,800,OPENGL);
  frameRate(60);
  blendMode(ADD);
  noFill();
  stroke(0,50);
  strokeWeight(3);
  
  boxs = new ArrayList<Box>();
  createBox(0,new PVector(0,0,0));
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2.0,height/2.0);
  rotateY(millis()/1000.0);
  for(Box b : boxs){
    b.draw();
  }
  if(frameCount%(round(frameRate))==0){
    boxs.clear();
    createBox(0,new PVector(0,0,0));
  }
  popMatrix();
}

void createBox(int n,PVector pos){
  if(n==N)return;
  
  float r=R;
  for(int i=0;i<n;i++){
    r/=2.0;
  }
  
  boxs.add(new Box(n,pos,r));
  
  float dist = r/4.0;
  int rand = (int)random(pow(2,8));
  if((rand>>>7)%2==1) createBox(n+1,new PVector(pos.x+dist,pos.y+dist,pos.z+dist));
  if((rand>>>6)%2==1) createBox(n+1,new PVector(pos.x+dist,pos.y+dist,pos.z-dist));
  if((rand>>>5)%2==1) createBox(n+1,new PVector(pos.x+dist,pos.y-dist,pos.z+dist));
  if((rand>>>4)%2==1) createBox(n+1,new PVector(pos.x+dist,pos.y-dist,pos.z-dist));
  if((rand>>>3)%2==1) createBox(n+1,new PVector(pos.x-dist,pos.y+dist,pos.z+dist));
  if((rand>>>2)%2==1) createBox(n+1,new PVector(pos.x-dist,pos.y+dist,pos.z-dist));
  if((rand>>>1)%2==1) createBox(n+1,new PVector(pos.x-dist,pos.y-dist,pos.z+dist));
  if((rand>>>0)%2==1) createBox(n+1,new PVector(pos.x-dist,pos.y-dist,pos.z-dist));
}