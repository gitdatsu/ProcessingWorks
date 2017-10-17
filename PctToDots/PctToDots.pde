PImage img;
int imgWidth;
int imgHeight;
float perW;
float perH;

float xnoise=0.0;
float ynoise=0.0;

//29572217
void setup(){
  //
  size(600,400);
  background(255);
  colorMode(RGB,256);
  noStroke();
  frameRate(300);
  
  img=loadImage("IMG_6802.JPG");
  img.loadPixels();
  imgWidth=img.width;
  imgHeight=img.height;
  for(int i=0;i<imgWidth;i++){
    for(int j=0;j<imgHeight;j++){
      
    }
  }
  perW=imgWidth/width;
  perH=imgHeight/height;

  //fade();
}

void draw(){
  
  int x = int(imgWidth*noise(xnoise));
  int y = int(imgHeight*noise(ynoise));
  
  color c = img.pixels[y*imgWidth+x];
  
  fill(red(c),green(c),blue(c),100);
  float d = random(5,20);
  
  ellipse(x/perW,y/perH,d,d);
  
  xnoise+=0.02*random(9);
  ynoise+=0.02*random(9);

}

void keyPressed(){
  if(key == ' '){
    save("img.png");
  }
}

void fade(){
  fill(255,255,255);
  rect(0,0,width,height);
}