class Rect extends Shape{
  PVector side;
  
  Rect(){
    super();
    side = new PVector(radius,radius);
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
    rect(0,0,side.x,side.y);
    popMatrix();
  }
}