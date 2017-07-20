ArrayList<PVector> P = new ArrayList<PVector>();
ArrayList<Float> R = new ArrayList<Float>();
ArrayList<Float> Rv = new ArrayList<Float>();
ArrayList<PVector> C = new ArrayList<PVector>();

int num;
float minRv,maxRv;

void setup(){
  //size(600,600);
  fullScreen();
  colorMode(HSB,360,100,100);
  
  num = 0;
  minRv = 5.0; maxRv = 12.0;
}

void draw(){
  background(0,0,100);
  //draw ellipse
  noStroke();
  
  for(int i=0;i<num;i++){
    Rv.set(i,Rv.get(i)-0.5);
    R.set(i,R.get(i)+Rv.get(i));
    if((float)R.get(i)<1) rm(i);
  }
  for(int i=0;i<num;i++){
    fill(C.get(i).x,C.get(i).y,C.get(i).z);
    ellipse(P.get(i).x,P.get(i).y,(float)R.get(i)*2,(float)R.get(i)*2);
  }
}

void keyPressed(){
  if(key==' '){
    mk();
  }
}

void mousePressed(){
  mk(new PVector(mouseX,mouseY));
}
void mouseDragged(){
  mk(new PVector(mouseX,mouseY));
}

void rm(int i){
  P.remove(i);
  R.remove(i);
  Rv.remove(i);
  C.remove(i);
  num--;
}

void mk(PVector pos){
  P.add(new PVector(pos.x,pos.y));
  R.add(1.0);
  Rv.add(random(minRv,maxRv));
  C.add(new PVector(random(360),100,100));
  num++;    
}
void mk(PVector pos,float init_rv){
  P.add(new PVector(pos.x,pos.y));
  R.add(1.0);
  Rv.add(init_rv);
  C.add(new PVector(random(360),100,100));
  num++;  
}
void mk(){
  mk(new PVector(random(width),random(height)),random(minRv,maxRv));
}