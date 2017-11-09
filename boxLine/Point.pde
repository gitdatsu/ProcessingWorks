class Point{
  PVector pos, posG;
  char dof;
  
  Point(PVector _p, char _dof){
    pos = new PVector();
    posG = new PVector();
    pos.set(_p);
    posG.set(_p);
    this.dof = _dof;
  }
  
  void update(){
    PVector v = posG.copy().sub(pos);
    if(v.mag()<0.1) move(boxSize/2.0*random(-1.0,1.0));
    pos.add(v.mult(0.04));
  }
  
  void move(float _goal){
    switch(dof){
      case 'x':
        posG.x = _goal;
        break;
      case 'y':
        posG.y = _goal;
        break;
      case 'z':
        posG.z = _goal;
        break;
      default :
        break;
    }
  }
}