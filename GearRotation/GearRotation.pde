ArrayList<Gear> gears;
float ptime;

void setup(){
  size(600,600);
  rectMode(CENTER);
  
  gears = new ArrayList<Gear>();
  PVector pos = new PVector(width/2.0,height/2.0);
  gears.add(new Gear(pos, 0, 70, 120, 8));
  pos.set(width/4.0, height/4.0);
  gears.add(new Gear(pos, 0, 35, 60, 10));
  pos.set(width*3.0/4.0, height*3.0/4.0);
  gears.add(new Gear(pos, 0, 35, 60, 8));
  
  
  ptime = 0;
}

void draw(){
  background(0);
  
  for(int i=0;i<gears.size();i++){
    Gear gear = gears.get(i);
    if(gear.ptime<floor(millis()/1000.0)){
      gear.ptime = floor(millis()/1000.0);
      gear.setRotGoal(gear.rot+PI/6.0);
    }
    gear.draw();
  }
  
}