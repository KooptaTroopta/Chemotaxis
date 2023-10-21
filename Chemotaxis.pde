lilarmy[] army = new lilarmy[60];
int speeeeed = 10;
PFont zawg;
void setup(){
  size(500,500);
  noStroke();
  frameRate(10);
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
  if (speeeeed > 110)
  speeeeed = 10;
  frameRate(speeeeed);
}
void draw(){
  for(int h = 0; h<=495; h = h+5) {
    fill(246-(h/500*112), 121+(h/5), 193+(h/500*62));
    rect(0,h,500,5);
  }
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
    for (int i = 0; i<60; i++) {
      emmy[i] = 5000;
      fred[i] = 5000;
    }
  }
  void show() {
    fill(c);
    rect(x,y,8,8);
    fill(255);
    rect(x+1,y+1,2,2);
    rect(x+5,y+1,2,2);
    rect(x+1,y+5,6,2);
  }
  void jimmy() {
    countE = 0;
    countF = 0;
    for (int i = 0; i<60; i++) {
      emmy[i] = 5000;
      fred[i] = 5000;
    }
    if (c == color(255,0,0)) {
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,0,255) && i != o){
          emmy[countE] = (int)(dist(army[i].x,army[i].y,x,y));
          if (emmy[countE]<12) {
            c = color(0,0,255);
          }
          countE++;
        }
      }
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,255,0) && i != o){
          fred[countF] = (int)(dist(army[i].x,army[i].y,x,y));
          countF++;
        }
      }
    } else if (c == color(0,255,0)) {
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(255,0,0) && i != o){
          emmy[countE] = (int)(dist(army[i].x,army[i].y,x,y));
          if (emmy[countE]<12) {
            c = color(255,0,0);
          }
          countE++;
        }
      }
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,0,255) && i != o){
          fred[countF] = (int)(dist(army[i].x,army[i].y,x,y));
          countF++;
        }
      }
    } else if (c == color(0,0,255)) {
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(0,255,0) && i != o){
          emmy[countE] = (int)(dist(army[i].x,army[i].y,x,y));
          if (emmy[countE]<12) {
            c = color(0,255,0);
          }
          countE++;
        }
      }
      for (int i = 0; i < 60; i++) {
        if (army[i].c == color(255,0,0) && i != o){
          fred[countF] = (int)(dist(army[i].x,army[i].y,army[o].x,army[o].y));
          countF++;
        }
      }
    }
    x += (int)(Math.random()*7-3);
    y += (int)(Math.random()*7-3);
    if (Math.random()<0.05) {
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
   } else {
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
    if (emmy[0] == 5000 && fred[0] == 5000) {
      frameRate(1);
      fill(c);
      textSize(30);
      zawg = createFont("Segoe UI",50);
      textFont(zawg);
      if (c == color(255,0,0)) {
        text("Red Wins!", 150, 250);
      } else if (c == color(0,255,0)) {
        text("Green Wins!",120,250);
      } else {
        text("Blue Wins!",130,250);
      }
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
