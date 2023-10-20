lilarmy[] army = new lilarmy[60];
int speeeeed = 20;
void setup(){
  size(500,500);
  for (int i = 0; i<20; i++) {
    army[i] = new lilarmy((int)(Math.random()*501),(int)(Math.random()*401),color(0,0,255),i);
  }
  for (int i = 20; i<40; i++) {
    army[i] = new lilarmy((int)(Math.random()*501),(int)(Math.random()*401),color(255,0,0),i);
  }
  for (int i = 40; i<60; i++) {
    army[i] = new lilarmy((int)(Math.random()*501),(int)(Math.random()*401),color(0,255,0),i);
  }
}
void mousePressed() {
  speeeeed += 20;
  if (speeeeed > 80)
  speeeeed = 20;
  frameRate(speeeeed);
}
void draw(){
  background(255);
  for (int i = 0; i<60; i++) {
    army[i].jimmy();
    army[i].show();
  }
}

class lilarmy {
  int x,y,count,c,o,countE,countF;
  int[] emmy = new int[60];
  int[] fred = new int[60];
  lilarmy(int a, int b, int co, int ind) {
    x = a;
    y = b;
    c = co;
    o = ind;
  }
  void show() {
    fill(c);
    rect(x,y,8,8);
  }
  void jimmy() {
    countE = 0;
    countF = 0;
    if (c == color(255,0,0)) {
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,0,255)){
          emmy[countE] = (int)(dist(army[i].x,army[i].y,x,y));
          if (emmy[countE]<12) {
            c = color(0,0,255);
          }
          countE++;
        }
      }
      for (int j = countE; j<60; j++) {
        emmy[j] = 1000;
      }
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,255,0)){
          fred[countF] = (int)(dist(army[i].x,army[i].y,x,y));
          countF++;
        }
      }
      for (int j = countF; j<60; j++) {
        fred[j] = 1000;
      }      
    } else if (c == color(0,255,0)) {
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(255,0,0)){
          emmy[countE] = (int)(dist(army[i].x,army[i].y,x,y));
          if (emmy[countE]<12) {
            c = color(255,0,0);
          }
          countE++;
        }
      }
      for (int j = countE; j<60; j++) {
        emmy[j] = 1000;
      }
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,0,255)){
          fred[countF] = (int)(dist(army[i].x,army[i].y,x,y));
          countF++;
        }
      }
      for (int j = countF; j<60; j++) {
        fred[j] = 1000;
      }
    } else {
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,255,0)){
          emmy[countE] = (int)(dist(army[i].x,army[i].y,x,y));
          if (emmy[countE]<12) {
            c = color(0,255,0);
          }
          countE++;
        }
      }
      for (int j = countE; j<60; j++) {
        emmy[j] = 1000;
      }
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(255,0,0)){
          fred[countF] = (int)(dist(army[i].x,army[i].y,army[o].x,army[o].y));
          countF++;
        }
      }
      for (int j = countF; j<60; j++) {
        fred[j] = 1000;
      }
    }
    x += (int)(Math.random*5-2);
    y += (int)(Math.random*5-2);
   if (Math.random()<0.7) {
     if (army[least(fred)].x > x) {
      x += (int)(Math.random()*3);
    } else {
      x -= (int)(Math.random()*3);
    }
    if (army[least(fred)].y > y) {
      y += (int)(Math.random()*3);
    } else {
      y -= (int)(Math.random()*3);
    }
   } else {
     if (army[least(emmy)].x > x) {
      x -= (int)(Math.random()*3);
    } else {
      x += (int)(Math.random()*3);
    }
    if (army[least(emmy)].y > y) {
      y -= (int)(Math.random()*3);
    } else {
      y += (int)(Math.random()*3);
    }
   }
    if (x<10) {
      x+=3;
    } else if (x>490) {
      x-=3;
    } else if (y<10) {
      y+=3;
    } else if (y>490){
      y-=3;
    }
  }
}
int least (int[] list) {
  int l = 0;
  for (int i = 0; i<list.length; i++) {
    if (list[l]>list[i]) {
      l = i;
    }
  }
  return l;
}


