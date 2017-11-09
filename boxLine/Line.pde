class Line{
  Point point1,point2;
  color c;
  float weight;
  
  Line(float areaSize){
    PVector[] v1 = new PVector[2];
    PVector[] v2 = new PVector[2];
    PVector[] v = new PVector[2];
    char[] dof = new char[2];
  
    for(int i=0;i<2;i++){
      // 1. get vertex1 
      int rand = (int)random(8);
      int x = (rand>>2)%2;
      int y = (rand>>1)%2;
      int z = rand%2;
      v1[i] = new PVector(x*2-1, y*2-1, z*2-1);// -1~1
      // 2. get vertex2
      v2[i] = new PVector();
      v2[i].set(v1[i]);
      rand = (int)random(3);
      switch(rand){
        case 0:
          v2[i].x*=-1;
          break;
        case 1:
          v2[i].y*=-1;
          break;
        case 2:
          v2[i].z*=-1;
          break;
        default:
          break;
      }
      
      v[i] = new PVector();
      v[i].set(v1[i]);
      if(v1[i].x!=v2[i].x){
        v[i].x = random(-1.0,1.0);
        dof[i] = 'x';
      }else if(v1[i].y!=v2[i].y){
        v[i].y = random(-1.0,1.0);
        dof[i] = 'y';
      }else if(v1[i].z!=v2[i].z){
        v[i].z = random(-1.0,1.0);
        dof[i] = 'z';
      }else{
        println("drawLine error");
      }
      v[i].mult(areaSize);
    }
    point1 = new Point(v[0], dof[0]);
    point2 = new Point(v[1], dof[1]);
    c = color(150);
    weight = 2.0;
  }
  
  void update(){
    point1.update();
    point2.update();
  }
  
  void draw(){
    noFill();
    stroke(c);
    strokeWeight(weight);
    line(point1.pos.x,point1.pos.y,point1.pos.z, point2.pos.x,point2.pos.y,point2.pos.z);
  }
  
  void move(float g1, float g2){
    point1.move(g1);
    point1.move(g2);
  }
  
  void createLine(float areaSize){
    PVector[] v1 = new PVector[2];
    PVector[] v2 = new PVector[2];
    PVector[] v = new PVector[2];
    char[] dof = new char[2];
  
    for(int i=0;i<2;i++){
      // 1. get vertex1 
      int rand = (int)random(8);
      int x = (rand>>2)%2;
      int y = (rand>>1)%2;
      int z = rand%2;
      v1[i] = new PVector(x*2-1, y*2-1, z*2-1);// -1~1
      // 2. get vertex2
      v2[i] = new PVector();
      v2[i].set(v1[i]);
      rand = (int)random(3);
      switch(rand){
        case 0:
          v2[i].x*=-1;
          break;
        case 1:
          v2[i].y*=-1;
          break;
        case 2:
          v2[i].z*=-1;
          break;
        default:
          break;
      }
      
      v[i] = new PVector();
      v[i].set(v1[i]);
      if(v1[i].x!=v2[i].x){
        v[i].x = random(-1.0,1.0);
        dof[i] = 'x';
      }else if(v1[i].y!=v2[i].y){
        v[i].y = random(-1.0,1.0);
        dof[i] = 'y';
      }else if(v1[i].z!=v2[i].z){
        v[i].z = random(-1.0,1.0);
        dof[i] = 'z';
      }else{
        println("drawLine error");
      }
      v[i].mult(areaSize);
    }
    point1.posG = v[0];
    point1.dof = dof[0];
    point2.posG = v[1];
    point2.dof = dof[1];
  }
}