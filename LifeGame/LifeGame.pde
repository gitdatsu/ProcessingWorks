boolean[][] states;
boolean[][] tempStates;
int[][] stateCounts;
int numW;
int numH;

void setup(){
  size(800,800);
  frameRate(60);
  
  stroke(255);
  strokeWeight(2);
  noStroke();
  
  numW = width/3;
  numH = height/3;
  
  states = new boolean[numW][numH];
  tempStates = new boolean[numW][numH];
  stateCounts = new int[numW][numH];
  
  for(int y=0;y<numH;y++){
    for(int x=0;x<numW;x++){
      states[x][y] = (random(2)<1);
      tempStates[x][y] = states[x][y];
      stateCounts[x][y] = 0;
    }
  }
}

void draw(){
  background(0);
  //update
  for(int y=0;y<numH;y++){
    for(int x=0;x<numW;x++){
      states[x][y] = returnNextState(x,y);
    }
  }
  //random birth
  /*
  int rand = (int)random(100);
  for(int i=0;i<rand;i++){
    states[(int)random(numW)][(int)random(numH)] = true;
  }
  */
  //draw
  float w = width/(float)numW;
  float h = width/(float)numW;
  for(int y=0;y<numH;y++){
    for(int x=0;x<numW;x++){
      if(states[x][y]) fill(255);
      else fill(0);
      if(60<stateCounts[x][y]) fill(255,0,0);
      rect(x*w, y*h, w, h);
      /*
      if(states[x][y]) stroke(255);
      else stroke(0);
      point(x*w, y*h);
      */
      //update tempStates
      tempStates[x][y] = states[x][y];
    }
  }
}

boolean returnNextState(int x,int y){
  //get count
  boolean nextState;
  int count=0;
  for(int j=-1;j<2;j++){
    for(int i=-1;i<2;i++){
      if((0<=x+i&&x+i<numW)&&(0<=y+j&&y+j<numH) && !(i==0&&j==0)){
        if(tempStates[x+i][y+j]) count++;
      }
    }
  }
  //return next state of pos
  if(3<count) nextState = false;
  else if(2<count) nextState = true;
  else if(1<count) nextState = tempStates[x][y];
  else nextState = false;

  //stateCount
  if(nextState == tempStates[x][y]){
    stateCounts[x][y]++;
    if(60<stateCounts[x][y]){
      if(120<stateCounts[x][y]){
        nextState = !tempStates[x][y];
        stateCounts[x][y] = 0;
      }
    }
  }else{
    stateCounts[x][y] = 0;
  }
  
  
  return nextState;
}