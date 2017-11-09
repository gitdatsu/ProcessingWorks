class Line{
  float sx,sy;//starting point
  float ex,ey;//ending point
  float x1,x2,y1,y2;//point
  float x,y;
  float w,h;//
  float t;//time count
  int fr;//framerate
  color c;
  
  boolean run(){
    boolean b;
    b=this.move();
    if(b) this.display();
    return b;
  }
  
  void display(){
    stroke(c);
    strokeWeight(1);
    line(x1,y1,x2,y2);
  }
  
  boolean move(){
    if((abs(this.x2-this.ex)<0.1)||(abs(this.y2-this.ey)<0.1)) return false;
    
    this.x1=this.x2;
    this.y1=this.y2;
    this.x2+=w;
    this.y2+=h;
    
    //this.x+=w;
    //this.y+=h;
    
    return true;
  }
  
  Line(float x,float y,int fr,color c){
    this.sx=x;
    this.sy=y;
    this.ex=x+(cos(random(2*PI))*width/8+random(-width/32,width/32));
    this.ey=y+(sin(random(2*PI))*height/8+random(-height/32,height/32));
    this.fr=fr;
    this.w=(ex-sx)/this.fr;
    this.h=(ey-sy)/this.fr;
    this.c=c;
    
    this.x1=x;
    this.y1=y;
    this.x2=x;
    this.y2=y;
    //this.x=x;
    //this.y=y;
    
  }
}