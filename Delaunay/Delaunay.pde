import java.util.Map;
import java.util.HashSet;
import java.util.Iterator;

DelaunayTriangles delaunay;  
ArrayList<Point> ptList = new ArrayList<Point>();  
int pointNum = 50;
  
void setup() {  
  size(800, 800);
  frameRate(60);
  //blendMode(ADD);
  
  for(int i = 0; i < pointNum; i++) {  
    ptList.add(new Point(random(width),random(height)));
    ptList.get(i).setV(random(-2.0,2.0),random(-2.0,2.0));
  }
  
    
  delaunay = new DelaunayTriangles(ptList);  
}  
  
void draw(){
  colorMode(RGB,255,255,255);
  background(0);  
  stroke(70);
  strokeWeight(2);
  noFill();
  smooth(); 
  
  for(int i = 0; i <ptList.size(); i++) {
    ptList.get(i).move();
  }
  
  
  delaunay.DelaunayTriangulation(ptList);
  delaunay.draw();  
}

void mouseClicked(){
  ptList.add(new Point(mouseX,mouseY));
  ptList.get(ptList.size()-1).setV(random(-2.0,2.0),random(-2.0,2.0));
}

void keyPressed(){
  if(key=='c'){
    ptList.clear();
  }
  if(key=='s'){
    save("img_"+month()+day()+hour()+minute()+second()+".png");
  }
}