// 20170618
// made by datchan

float step;
float noiseScale;

int NUM = 5000;
ArrayList<Agent> agents;

void setup(){
  size(600,600);
  background(0);
  
  step = 20;
  noiseScale = 0.03;
  
  agents = new ArrayList<Agent>();
  for(int i=0;i<NUM;i++){
    agents.add(new Agent());
  }
}

void draw(){
  blendMode(BLEND);
  noStroke();
  fill(0,20);
  rect(0,0,width,height);

  blendMode(ADD);
  for(int i=0;i<NUM;i++){
    agents.get(i).update();
    agents.get(i).draw();
  }
}

void keyPressed(){
  if(key==' '){
    for(int i=0;i<NUM;i++){
      agents.get(i).pos.set(random(width),random(height));
    }
  }
}