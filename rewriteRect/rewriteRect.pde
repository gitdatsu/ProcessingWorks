// 20170618
// made by datchan

float INIT_SIDE = 600;
int MAXNUM = 10;

int num;

void setup() {
  size(1080, 1080);
  background(0);
  rectMode(CENTER);
  blendMode(ADD);
  noFill();
  stroke(10, 40, 255);

  num = 0;

  translate(width/2, height/2);
  rotate(PI/4.0);

  drawRect(0, 0, 0);
}

void draw() {
}

void drawRect(int n, float x, float y) {
  if (n == MAXNUM) return;

  int side = (int)(INIT_SIDE/pow(2, n));
  rect(x, y, side, side);
  int rand = (int)random(4.2);
  if (rand!=0)drawRect(n+1, x+side/4, y-side/4);
  if (rand!=1)drawRect(n+1, x-side/4, y-side/4);
  if (rand!=2)drawRect(n+1, x-side/4, y+side/4);
  if (rand!=3)drawRect(n+1, x+side/4, y+side/4);
}

void keyPressed() {
  if (key == 's') {
    save("img_"+month()+day()+hour()+minute()+second()+".png");
    print("saved.\n");
  }
}