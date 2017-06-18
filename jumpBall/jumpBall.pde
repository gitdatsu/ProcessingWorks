// 2017/06/16
// made by datchan

int ellipseNum = 10;//number
float x[] = new float[ellipseNum];
float y[] = new float[ellipseNum];
float speed[] = new float[ellipseNum];
float jump[] = new float[ellipseNum];

//-----------------------------------------------------------------------------
void setup(){
  size(800,600);
  background(0);
  frameRate(60);
  
  colorMode(HSB,360,100,100,100);
  
  for(int i=0;i<ellipseNum;i++){
    x[i] = random(width);
    y[i] = height;
    speed[i] = random(-10,10);
    jump[i] = 0;
  }
}

void draw(){
  background(0);
  for(int i=0;i<ellipseNum;i++){
    //moveX();
    x[i] += speed[i];
    if(x[i]<0 || width<x[i]) speed[i]*=-1;
    //updateJump();
    jump[i]++;
    //moveY();
    y[i] += jump[i];
    if(height<y[i]) y[i] = height;
    if(y[i]<0){
      y[i]=0;
      jump[i]=0;
    }
    //drawEllipse();
    fill(i*(360.0/ellipseNum),100,100);
    ellipse(x[i],y[i],20,20);
  }
}

void keyPressed(){
  int num = key-'0';
  print(num);
  if(0<=num && num<=9) jump[num] = -20;
}