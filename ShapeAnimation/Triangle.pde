class Triangle extends Shape{
  float side;
  
  Triangle(){
    super();
    side = radius;
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
    beginShape();
    float r = side*sqrt(3.0)/3.0;
    for(int i=0;i<3;i++){
      float x = r*cos(PI*3.0/2.0+i*2.0/3.0*PI);
      float y = r*sin(PI*3.0/2.0+i*2.0/3.0*PI);
      vertex(x,y);
    }
    endShape();
    popMatrix();
  }
}