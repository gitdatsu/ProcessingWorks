class Point{
  PVector pos,vec,acc;
  float r;
  color c;
  
  void setup(PVector pos,PVector vec,PVector acc,float r,color c){
    this.pos = pos;
    this.vec = vec;
    this.acc = acc;
    this.r = r;
    this.c = c;
  }
  
  boolean update(){              
    move();
    return true;
  }
                                           
  void draw(){
    pushMatrix();
    translate(0,height);
    scale(1,-1);
    noStroke();
    fill(c);
    ellipse(pos.x,pos.y,r,r);
    popMatrix();
   }
  
  void move(){
    vec.add(acc);
    pos.add(vec);
  }
}