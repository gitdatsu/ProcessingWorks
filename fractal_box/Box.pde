class Box{
  int num;
  PVector pos;
  float r;
  color colour;
  
  Box(){
    this.pos = new PVector(0,0,0);
    r = 200.0;
    colour = color(255,80);
  }
  Box(int num,PVector pos,float r){
    this.num = num;
    this.pos = new PVector(pos.x,pos.y,pos.z);
    this.r = r;
    colour = color(20,60,240,200);
  }
  
  void draw(){
    pushMatrix();
    translate(pos.x,pos.y,pos.z);    
    noFill();

    float geta = 50;
    stroke(pos.x+geta,pos.y+geta,pos.z+geta,80);
    strokeWeight(1);
    box(r);

    popMatrix();
  }
}