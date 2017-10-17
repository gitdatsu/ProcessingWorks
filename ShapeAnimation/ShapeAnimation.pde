ArrayList<Ellipse> ellipses;
ArrayList<Rect> rects;
ArrayList<Triangle> triangles;
int n_e;
int n_r;
int n_t;

void setup(){
  size(800,800);
  background(0);
  
  colorMode(HSB,360,100,100,100);
  rectMode(CENTER);
  
  ellipses = new ArrayList<Ellipse>();
  rects = new ArrayList<Rect>();
  triangles = new ArrayList<Triangle>();
  
  n_e = (int)random(30,50);
  for(int i=0;i<n_e;i++){
    Ellipse e = new Ellipse();
    e.pos.set(random(width),random(height));
    e.radius = random(10,50);
    e.r.set(e.radius,e.radius);
    e.vec.set(0,-e.radius*0.1);
    e.isStroke = false;
    e.cFill = color(random(360),random(50,100),random(80,100),80);
    ellipses.add(e);
  }
  
  n_r = (int)random(10,30);
  for(int i=0;i<n_r;i++){
    Rect r = new Rect();
    r.pos.set(random(width),random(height));
    r.radius = random(30,100);
    r.side.set(r.radius,r.radius);
    r.vec.set(0,-r.radius*0.05);
    r.isStroke = false;
    r.cFill = color(random(360),random(50,100),random(80,100),80);    
    rects.add(r);
  }
  
  n_t = (int)random(10,30);
  for(int i=0;i<n_t;i++){
    Triangle t = new Triangle();
    t.pos.set(random(width),random(height));
    t.radius = random(80,200);
    t.side = t.radius;
    t.vec.set(0,-t.radius*0.05);
    t.isStroke = false;
    t.cFill = color(random(360),random(50,100),random(80,100),80);
    triangles.add(t);
  }
  
}

void draw(){
  background(360,0,100);
  stroke(0);
  //line(0,height/2.0,width,height/2.0);
  //line(width/2.0,0.0,width/2.0,height);
  
  for(int i=0;i<n_e;i++){
    Ellipse e = ellipses.get(i);
    e.vec.set(0,-4+(-50*abs(e.pos.y-height/2.0)/height/2.0));
    e.draw();
  }
  
  
  for(int i=0;i<n_r;i++){
    Rect r = rects.get(i);
    r.vec.set(0,-4+(-50*abs(r.pos.y-height/2.0)/height/2.0));
    r.rot+=0.08;
    r.draw();
  }
  
  for(int i=0;i<n_t;i++){
    Triangle t = triangles.get(i);
    t.vec.set(0,-4-50*abs(t.pos.y-height/2.0)/height/2.0);
    t.rot += 0.08;
    t.draw();
  }
  
  
  
}