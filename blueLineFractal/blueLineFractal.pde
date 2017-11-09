ArrayList<Line> line;

boolean play;

void setup(){
  //fullScreen();
  size(800,600);
  frameRate(120);
  colorMode(HSB,360,100,100,100);
  rectMode(CENTER);
  ellipseMode(CENTER);
  blendMode(ADD);
  smooth();
  
  stroke(0,0,100,50);
  strokeWeight(1);
  
  background(0,0,0);
  
  loadPixels();
  
  line=new ArrayList<Line>();
  for(int i=0;i<3;i++){
    line.add(new Line(random(0,width),random(0,height),60,color(225,100,100,25)));
  }
  
  play=true;
  
  
}

void draw(){
  //if(play){
    for(int i=0;i<line.size();i++){
      Line l = line.get(i);
      if(!l.run()){
        if(line.size()<1000){
          for(int j=0;j<random(3);j++){  
              line.add(new Line(l.ex,l.ey,60,color(225,100,100,25)));
          }
          line.remove(i);
        }else{
          for(int j=0;j<random(500);j++){
            line.remove(j);
          }
        }
      }
    }
  //}
}

void keyPressed(){
  if(key == ' '){
    play=!play;
  }
  if(key=='s'){
    save("img_"+month()+day()+hour()+minute()+second()+".png");
  }
}