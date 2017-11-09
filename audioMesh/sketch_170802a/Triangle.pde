class Triangle{
  PVector p1,p2,p3;
  color cFill,cStroke;
  float wStroke;
  boolean bFill;
  boolean bStroke;
  
  Triangle(PVector p1,PVector p2,PVector p3){
    this.p1 = new PVector(p1.x,p1.y);
    this.p2 = new PVector(p2.x,p2.y);
    this.p3 = new PVector(p3.x,p3.y);
    
    cFill = color(220);
    cStroke = color(40);
    wStroke = 1;
    
    bFill = true;
    bStroke = true;
  }
  
  // set,move vertex
  void setVertex(int index,PVector p){
    switch(index){
      case 0: this.p1.set(p); break;
      case 1: this.p2.set(p); break;
      case 2: this.p3.set(p); break;
    }
  }
  void moveVertex(int index,PVector v){
    switch(index){
      case 0: this.p1.add(v); break;
      case 1: this.p2.add(v); break;
      case 2: this.p2.add(v); break;
    }
  }
  
  // set color
  void setCFill(color cf){
    this.cFill = cf;
  }
  void setCStroke(color cs){
    this.cStroke = cs;
  }
  
  void draw(){
    
    if(bFill) fill(cFill);
    else noFill();
    if(bStroke){
      stroke(cStroke);
      strokeWeight(wStroke);
    }
    else noStroke();
    
    beginShape();
    vertex(p1.x,p1.y);
    vertex(p2.x,p2.y);
    vertex(p3.x,p3.y);
    endShape();
    
    strokeWeight(5);
    stroke(255,0,0);
    point(p1.x,p1.y);
    stroke(0,255,0);
    point(p2.x,p2.y);
    stroke(0,0,255);
    point(p3.x,p3.y);
  }
}