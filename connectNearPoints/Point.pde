class Point{
  PVector pos,vec,acc;
  float radius;
  color colour;
  
  Point(){
    this.pos = new PVector(random(width),random(height));
    this.vec = new PVector(1.0,0);
    this.vec.rotate(random(2*PI));
    this.acc = new PVector(0,0);
    this.radius = 3;
    colour = color(255);
  }
  
  void update(){
    vec.add(acc);
    move();
  }
  
  void move(){
    pos.add(vec);
    if(pos.x<0){
      pos.x=width;
      pos.y = random(height);
    }else if(pos.x>width){
      pos.x=0;
      pos.y = random(height);
    }else if(pos.y<0){
      pos.y=height;
      pos.x = random(width);
    }else if(pos.y>height){
      pos.y=0;
      pos.x = random(width);
    }
  }
  
  void draw(){
    stroke(colour);
    strokeWeight(radius);
    point(pos.x,pos.y);
  }
  
}