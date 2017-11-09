int N;

ArrayList<PVector> points1,points2;
ArrayList<Line> lines;

float outlineX, outlineY;
float boxSize;

boolean isDrawBox;

void setup(){  
  size(600,600,P3D);

  smooth();
  
  outlineX = width/4.0;
  outlineY = height/4.0;
  boxSize = min(width,height)-2.0*min(outlineX, outlineY);
  println("boxSize:"+boxSize);
  
  points1 = new ArrayList<PVector>();
  points2 = new ArrayList<PVector>();
  lines = new ArrayList<Line>();
  
  N = 200;
  
  for(int i=0;i<N;i++){
    lines.add(new Line(boxSize/2.0));
    color c = color(20+random(-50,50),60+random(-50,50),120+random(-50,50));
    lines.get(i).c = c;
    //addPoints(boxSize/2.0);
  }
  
  isDrawBox = true;
}

void draw(){
  background(0);
  
  float camR = boxSize*2.0;
  float theta = (((float)mouseX/width)*2.0-1.0)*PI;
  float phi = (((float)mouseY/height)*2.0-1.0)*PI/2.0;
  float cx,cy,cz;
  cx = camR * cos(phi) * cos(theta);
  cy = camR * sin(phi);
  cz = camR * cos(phi) * sin(theta);
  
  translate(width/2.0,height/2.0,0.0);  
  camera(cx,cy,cz,0,0,0,0,1,0);
  rotateY((float)frameCount/120.0);
  noFill();
  stroke(250);
  strokeWeight(4);
  if(isDrawBox)box(boxSize);
  
  for(int i=0;i<N;i++){
    Line l = lines.get(i);
    l.update();
    l.draw();
  }
  
  
}

void keyPressed(){
  if(key==' '){
    isDrawBox = !isDrawBox;
  }
}

void mouseClicked(){
  for(int i=0;i<N;i++){
    Line l = lines.get(i);
    //l.createLine(boxSize/2.0);
    l.point1.move(boxSize/2.0*random(-1,1));
    l.point2.move(boxSize/2.0*random(-1,1));
  }
}