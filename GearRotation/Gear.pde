class Gear{
  PVector pos;
  float rot,rotGoal;
  float radIn,radOut;
  int teethNum;
  
  float ptime;
  
  Gear(PVector _pos, float _rot,float _radIn, float _radOut, int _teethNum){
    this.pos = new PVector(_pos.x,_pos.y);
    this.rot = _rot;
    this.rotGoal = this.rot;
    this.radIn = _radIn;
    this.radOut = _radOut;
    this.teethNum = _teethNum;
    this.ptime = 0;
  }
  
  void draw(){
    println(radOut);
    pushMatrix();
      translate(pos.x,pos.y);
      rot += (rotGoal-rot)*0.4;
      rotate(rot);
      noStroke();
      fill(255);
      for(int i=0;i<teethNum;i++){
        rect(radOut,0,radOut/3.0,radOut/3.0);
        rotate(2.0*PI/teethNum);
      }
      ellipse(0,0,radOut*2.0,radOut*2.0);
      fill(0);
      ellipse(0,0,radIn*2.0,radIn*2.0);
    popMatrix();
  }
  
  void setRotGoal(float r){
    rotGoal = r;
  }
}