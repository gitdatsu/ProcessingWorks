class Agent{
    PVector pos,vec;
    color colour;
    float speed;
    
    Agent(){
      pos = new PVector(random(width),random(height));
      vec = new PVector(0,0);
      colour = color(20,50,200);
      speed = 1.0;
    }
    
    void update(){
      float angle = map(noise(pos.x*noiseScale,pos.y*noiseScale),0,1,0,2*PI);
      vec.set(speed,0);
      vec.rotate(angle);
      pos.add(vec);
      if(pos.x<0||width<pos.x || pos.y<0||height<pos.y) pos.set(random(width),random(height));
    }
    
    void draw(){
      stroke(colour);
      strokeWeight(1);
      fill(colour);
      point(pos.x,pos.y);
    }  
}