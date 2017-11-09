class Easing{
  float start,goal;

  float initTime;
  float endTime;

  Easing(){
    start = 0;
    goal = 0;
    initTime = millis()/1000.0;
    endTime = initTime+1.0;
  }
  
  float getValue(){
    float t = millis()/1000.0;
    float pst = (t-initTime)/(endTime-initTime);
    if(pst>1.0) pst = 1.0;
    return (goal-start)*calc(pst) + start;
  }
  
  void set(float s, float g, float t){
    initTime = millis()/1000.0;
    endTime = initTime + t;
    start = s;
    goal = g;
  }
  
  float calc(float pst){
    return pow(pst,1.0/1.2);
  }
}