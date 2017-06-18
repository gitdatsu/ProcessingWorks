class Agent{
  PVector pos,vec;
  
  color colour;
  float speed;
  
  Agent(){
    float theta = random(-PI/2.0,PI/2.0);//y
    float phi = random(2*PI);//x-z
    
    float x = radius * cos(theta) * cos(phi);
    float y = radius * sin(theta);
    float z = radius * cos(theta) * sin(phi);
    
    pos = new PVector(x,y,z);
  }
  
}