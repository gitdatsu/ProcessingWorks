float theta,phi;
float v_theta,v_phi;
float a_theta,a_phi;
float seed_theta,seed_phi;
float r;
float x,y,z;
float px,py,pz;

void setup(){
  size(800,800,P3D);

  background(0);
  stroke(255,150);
  noFill();
  strokeWeight(2);
  
  theta = random(2.0*PI);
  phi = random(-PI/2.0,PI/2.0);
  
  seed_theta = random(100);
  seed_phi = random(100);
  
  r = 300;

  x = r*cos(phi)*cos(theta);
  y = r*sin(phi);
  z = r*cos(phi)*sin(theta);
}

void draw(){
  if(frameCount%60==0){
    noStroke();
    fill(0,10);
    rect(0,0,width,height);
  }
  
  println(theta);
  theta += 0.4*(noise(seed_theta)-0.5)*2.0;
  phi += 0.4*(noise(seed_phi)-0.5)*2.0;
  
  px = x;
  py = y;
  pz = z;
  x = r*cos(phi)*cos(theta);
  y = r*sin(phi);
  z = r*cos(phi)*sin(theta);
  
  pushMatrix();
  translate(width/2.0,height/2.0);
  stroke(255,150);
  noFill();
  line(x,y,z,px,py,pz);
  popMatrix();

  seed_theta += 0.01;
  seed_phi += 0.01;

}