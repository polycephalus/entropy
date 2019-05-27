int m_num = 300; //600
Mover[] movers = new Mover[m_num];

void setup() {
  frameRate(24);
  size(600, 400);
  //fullScreen();
  colorMode(HSB, 100, 100, 100, 100); //

  for (int i=0; i<m_num; i++) {
    int c = i%100;
    movers[i] = new Mover(width/2, height/2, c); //gen rand pos
  }
  //background(0);
}

void draw() {
  //background(100, 20, 100); //bby pink
  background(0);
  //enhanced for loop
  //[type] [iterator]:[array]
  for (Mover mover:movers) {
    mover.move();
    mover.display();
    mover.bounce();
  }
}

class Mover {
  PVector pos;
  PVector vel;
  PVector acc;
  int posx, posy, c; //buu?
  float a; //alpha

  Mover(int temp_posx, int temp_posy, int temp_c) {
    posx = temp_posx;
    posy = temp_posy;
    c = temp_c;
    pos = new PVector(posx, posy);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    a = random(0, 100);
  }

  void move() {
    //acc.x = .05;
    //acc.y = -.02;
    acc = PVector.random2D();
    vel.add(acc);
    vel.limit(3);
    pos.add(vel);
  }

  void display() {
    noStroke();
    //fill(#F7F396);
    //fill(c, 80, 30, 40);
    //ellipse(pos.x+5, pos.y+5, 15, 15);
    fill(c, 80, 100, a); //alpha 40
    ellipse(pos.x, pos.y, 15, 15);
  }

  void bounce() {
    //if (pos.x>width || pos.x<0) {
    //  vel.x *= -10;
    //}
    //if (pos.y>height || pos.y<0) {
    //  vel.y *= -10;
    //}
    if (dist(width/2, height/2, pos.x, pos.y) > 120) {
      vel.x *= -10;
      vel.y *= -10;
    }
  }
}