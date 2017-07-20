class Fire extends Point{
  int count;
  int maxTime;
  float maxFrameCount;
  
  void setup(PVector pos,PVector vec,PVector acc,float r,color c){
    this.pos = pos;
    this.vec = vec;
    this.acc = acc;
    this.r = r;
    this.c = c;
    
    count = 0;
    maxTime = 5;
    maxFrameCount = frameRate*maxTime;
  }
  
  boolean update(){
    count++;
    if(count>maxFrameCount) return false;    
    move();
    float alpha = map(count,0,maxFrameCount,200,0);
    c = color(hue(c),saturation(c),brightness(c),alpha);
    return true;
  }
}