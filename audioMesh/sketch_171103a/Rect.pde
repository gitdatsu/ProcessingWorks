class Rect{
  PVector pos;
  PVector r;
  float weight;
  float rot;
  boolean isFill,isStroke;
  
  
  Rect(){
    this.pos = new PVector(0,0);
    this.r = new PVector(10,10);
    this.weight=1;
    this.rot = 0;
    this.isFill = true;
    this.isStroke = true;
  }
  
  Rect(PVector p,PVector r, float w, float rot){
    this.pos = new PVector(p.x,p.y);
    this.r = new PVector(r.x,r.y);
    this.weight=w;
    this.rot = rot;
    this.isFill = true;
    this.isStroke = true;
  }
  
  void draw(){
    if(isFill)fill(255);
    else noFill();
    if(isStroke)stroke(255);
    else noStroke();
    strokeWeight(weight);
    
    rectMode(CENTER);
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(rot);
    rect(0,0,r.x,r.y);
    popMatrix();
    
  }
}