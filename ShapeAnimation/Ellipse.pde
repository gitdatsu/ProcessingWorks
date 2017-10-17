class Ellipse extends Shape{
  PVector r;
  
  Ellipse(){
    super();
    r = new PVector(radius,radius);
  }
  
  @Override
  void draw(){
    update();
    if(isStroke)stroke(this.cStroke);
    else noStroke();
    if(isFill)fill(this.cFill);
    else noFill();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(rot);
    ellipse(0,0,r.x,r.y);
    popMatrix();
  }
}