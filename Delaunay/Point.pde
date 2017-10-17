class Point extends PVector {
  PVector v = new PVector(0,0,0);
  
  public Point() {  
    super();
  }
  public Point(float x, float y) {  
    super(x, y);
  }
  public Point(float x, float y, float z) {  
    super(x, y, z);  
  }  
  public Point(PVector v) {  
    this.x = v.x;  
    this.y = v.y;  
    this.z = v.z;  
  }  
    
  public boolean equals(Object o) {  
    boolean retVal;  
    try {  
      PVector p = (PVector)o;  
      return (x == p.x && y == p.y && z == p.z);  
    } catch (Exception ex) {  
      return false;  
    }  
  }  
  
  public void draw() {  
    point(x, y);  
  }
  
  public void setV(float speed){
    PVector v = new PVector(speed,0);
    v.rotate(random(2*PI));
    setV(v.x,v.y);
  }
  public void setV(float vx,float vy){
    this.v.x=vx;
    this.v.y=vy;
  }
  public void setV(float vx,float vy,float vz){
    this.v.x=vx;
    this.v.y=vy;
    this.v.z=vz;
  }
  
  public void move(){
    move(v.x,v.y);
  }
  public void move(float vx,float vy){
    x+=vx;
    if(width<x) x=0;
    if(x<0) x=width;
    y+=vy;
    if(height<y) y=0;
    if(y<0) y=height;
    
  }
  public void move(float vx,float vy,float vz){
    this.x+=vx;
    this.y+=vy;
    this.z+=vz;
  }
  
}