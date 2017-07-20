class FireworkBall extends Point{
  float HighestGoal;
  float minGoal,maxGoal;
  float time,t,a,v0;
  
  void setup(){
    minGoal = height/4.0;
    maxGoal = height*3.0/4.0;
    HighestGoal = random(minGoal,maxGoal);
    time = 3.0;
    
    t = frameRate*time;
    a = -2*HighestGoal/(t*t);
    v0 = -a*t;
    
    this.pos = new PVector(random(width),0);
    this.vec = new PVector(0,v0);
    this.acc = new PVector(0,a);
    this.r = map(HighestGoal,minGoal,maxGoal,1,10);
    this.c = color(150);
    
    if(DEBUG) print("(t,a,v0)=("+t+","+a+","+v0+")\n");
  }
  
  @Override
  boolean update(){
    move();
    if(vec.y<0)return false;
    float alpha = map(pos.y,0,HighestGoal,300,-50);
    c = color(hue(c),saturation(c),brightness(c),alpha);
    return true;
  }
}