class Points{
  int pNum;
  Point[] points;
  float maxDist;
  
  Points(){
    this.pNum = 50;
    this.points = new Point[pNum];
    for(int i=0;i<pNum;i++){
      points[i] = new Point();
    }
    this.maxDist = width/3.0;
  }
  
  void draw(){
    for(int i=0;i<pNum;i++){
      points[i].update();
      points[i].draw();      
    }
    for(int i=0;i<pNum;i++){
      for(int j=i+1;j<pNum;j++){
        float distance = points[i].pos.dist(points[j].pos);
        if(distance<maxDist){
          drawLine(points[i],points[j],distance);
        }
      }
    }
  }
  
  void drawLine(Point p1,Point p2,float distance){
    float alpha = (1.0-distance/maxDist)*255.0;
    stroke(255,alpha);
    strokeWeight(1);
    line(p1.pos.x,p1.pos.y,p2.pos.x,p2.pos.y);
  }
}