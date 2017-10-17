class Triangle{  
  public Point p1, p2, p3;  
    
  public Triangle(PVector p1, PVector p2, PVector p3){  
    this.p1 = p1 instanceof Point ? (Point)p1 : new Point(p1);  
    this.p2 = p2 instanceof Point ? (Point)p2 : new Point(p2);  
    this.p3 = p3 instanceof Point ? (Point)p3 : new Point(p3);  
  }  
    
  public boolean equals(Object obj) {  
    try {  
      Triangle t = (Triangle)obj;  
      return(p1.equals(t.p1) && p2.equals(t.p2) && p3.equals(t.p3) ||  
             p1.equals(t.p2) && p2.equals(t.p3) && p3.equals(t.p1) ||  
             p1.equals(t.p3) && p2.equals(t.p1) && p3.equals(t.p2) ||  
                
             p1.equals(t.p3) && p2.equals(t.p2) && p3.equals(t.p1) ||  
             p1.equals(t.p2) && p2.equals(t.p1) && p3.equals(t.p3) ||  
             p1.equals(t.p1) && p2.equals(t.p3) && p3.equals(t.p2) );  
    } catch (Exception ex) {  
      return false;  
    }  
  }  
     
  public int hashCode() {  
    return 0;  
  }  
    
  public void draw() {
    stroke(140);
    strokeWeight(1);
    triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    
    colorMode(HSB,360,100,100,100);
    
    stroke(getHue(p1.dist(p2)),100,100);
    line(p1.x,p1.y,p2.x,p2.y);
    stroke(getHue(p2.dist(p3)),100,100);
    line(p2.x,p2.y,p3.x,p3.y);
    stroke(getHue(p3.dist(p1)),100,100);
    line(p3.x,p3.y,p1.x,p1.y);
    
    
    stroke(255);
    strokeWeight(3);
    p1.draw();
    p2.draw();
    p3.draw();
    
  }
    
  public boolean hasCommonPoints(Triangle t) {  
    return (p1.equals(t.p1) || p1.equals(t.p2) || p1.equals(t.p3) ||  
            p2.equals(t.p1) || p2.equals(t.p2) || p2.equals(t.p3) ||  
            p3.equals(t.p1) || p3.equals(t.p2) || p3.equals(t.p3) );  
  }
  
  private float getHue(float range){
    float minHue = -40.0;
    float maxHue = 230.0;
    float maxRange = 200;
    
    float hue;
    if(range<maxRange) hue = map(range,0.0,maxRange,minHue,maxHue);
    else hue = maxHue;
    return hue;
  }
}