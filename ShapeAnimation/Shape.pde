abstract class Shape{
  //field
  PVector pos,vec;
  float rot;
  float radius;
  boolean isStroke;
  color cStroke;
  boolean isFill; color cFill;
  //constract
  Shape(){
    pos = new PVector(0,0);
    vec = new PVector(0,0);
    rot = random(2.0*PI);
    radius = 50;
    
    isStroke = true;
    cStroke = color(255);
    isFill = true;
    cFill = color(255);
  }

  abstract void draw();
  
  void update(){
    this.pos.add(this.vec);
    if(pos.x<0||width<pos.x){
      pos.x = width-pos.x;
      pos.y = random(height);
    }
    if(pos.y<0||height<pos.y){
      pos.y = height-pos.y;
      pos.x = random(width);
    }
  }
}