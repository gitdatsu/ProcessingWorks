int edgeNum;
PVector[] edges;
float[] edgesW;
float totalW;

int p1,p2;

void setup(){
  size(600,600);
  background(0);
  //frameRate(60);
  //colorMode(HSB,360,100,100,100);
  blendMode(ADD);
  
  edgeNum = 20;
  edges = new PVector[edgeNum];
  edgesW = new float[edgeNum];
  totalW = 0;
  
  for(int i=0;i<edgeNum;i++){
    edgesW[i] = random(100000);
    println(i+":"+edgesW[i]);
    totalW += edgesW[i];
  }
  
  println("\n"+"totalW:"+totalW+"\n");
  
  noStroke();
  fill(255);
  for(int i=0;i<edgeNum;i++){
    edges[i] = new PVector(random(width),random(height));
    float r = 100.0*edgesW[i]/totalW;
    //ellipse(edges[i].x,edges[i].y,r,r);
  }
  
  p1 = p2 = 0;
}

void draw(){
  p1 = p2;
  do{
    p2 = getRandomIndex();
  }while(p1==p2 && p2==-1);
  
  drawLine();
  //println(p1+" , "+p2);
}

void drawLine(){
  float x = (edges[p1].x+edges[p2].x)/2.0;
  float y = (edges[p1].y+edges[p2].y)/2.0;
  float noiseX = random(-10,10);
  float noiseY = random(-40,-100);
  PVector center = new PVector(x+noiseX,y+noiseY);
  
  stroke(20,40,160,50);
  noFill();

  beginShape();
  curveVertex(edges[p1].x,edges[p1].y);
  curveVertex(edges[p1].x,edges[p1].y);
  curveVertex(center.x,center.y);
  curveVertex(edges[p2].x,edges[p2].y);
  curveVertex(edges[p2].x,edges[p2].y);
  endShape();
}

int getRandomIndex(){
  int retIndex = -1;
  
  float value = random(1,totalW+1);
  
  for(int i=0;i<edgeNum;i++){
    if(edgesW[i] >= value){
      retIndex = i;
      break;
    }
    value -= edgesW[i];
  }
  
  return retIndex;
}

void keyPressed(){
  if(key == 's'){
    save("img_"+day()+hour()+minute()+second());
  }
}