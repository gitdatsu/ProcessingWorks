import ddf.minim.*;
Minim minim;
AudioPlayer player;

final boolean DEBUG = false;

ArrayList<FireworkBall> balls;
ArrayList<Fire> fires;



void setup(){
  size(1280,720);
  //fullScreen();
  background(0);
  colorMode(HSB,360,100,100,100);
  
  balls = new ArrayList<FireworkBall>();
  fires = new ArrayList<Fire>();
  
  minim = new Minim(this);
  player = minim.loadFile("fireworks3.mp3");
}



void draw(){
  //draw background
  fill(0,10);
  rect(0,0,width,height);
  
  //draw balls
  for(int i=0;i<balls.size();i++){
    if(!balls.get(i).update()){      
      player.rewind();
      int fireNum = 48;
      float rad = 2.0*PI/fireNum;
      Point point = balls.get(i);
      point.c = color(random(360),random(50,100),100);
      for(int j=0;j<fireNum;j++){
        PVector p = new PVector();
        PVector v = new PVector(random(0.1,0.7),0.0);
        PVector a = new PVector(0.0,-0.002);
        float r;
        color c;
        
        p.set(point.pos);
        v.rotate(j*rad);
        v.add(0.0,0.5);
        //a.set(point.acc);
        r = point.r;
        c = color(point.c);//point.c,
        if(DEBUG) print("(p,v,a,r,c)=("+p+","+v+","+a+","+r+","+c+")\n");
        
        Fire f = new Fire();
        f.setup(p,v,a,r,c);
        fires.add(f);
        
        if(DEBUG) print("fire add.size="+fires.size()+".\n");
      }
      balls.remove(i);
      player.play();
    }
    else balls.get(i).draw();
  }
  
  //draw fire
  for(int i=0;i<fires.size();i++){
    if(!fires.get(i).update()){
      if(DEBUG) print("fire remove.\n");
      fires.remove(i);
    }
    else fires.get(i).draw();
  }
}



void stop(){
  player.close();
  minim.stop();
  super.stop();
}



void keyPressed(){
  if(key == ' '&&balls.size()<10){
    balls.add(new FireworkBall());
    balls.get(balls.size()-1).setup();
    if(DEBUG) print("balls add, size="+balls.size()+"\n");
  }
}