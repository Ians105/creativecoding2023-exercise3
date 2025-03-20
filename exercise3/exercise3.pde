PImage bg, startNormal, startHover, lose, win, restart, ship;

final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_LOSE = 2;
final int GAME_WIN = 3;
int gameState = GAME_START;

final int BUTTON_TOP = 210;
final int BUTTON_BOTTOM = 280;
final int BUTTON_LEFT = 115;
final int BUTTON_RIGHT = 450;

float shipX, shipY;
float shipSpeed = 5;
float shipWidth = 50;

float wall1Speed = 1;
float wall2Speed = 2;
float wall3Speed = 3;

float wall1Y = 100;
float wall2Y = 200;
float wall3Y = 300;

float wall1X;
float wall2X;
float wall3X;

float wall1HoleWidth = 300;
float wall2HoleWidth = 200;
float wall3HoleWidth = 100;

float winningLineY = 400;

color wallColor;

void setup() {
  size(600, 500);
  bg=loadImage("img/bg.png");
  startNormal=loadImage("img/start1.png");
  startHover=loadImage("img/start2.png");
  lose=loadImage("img/lose.png");
  win=loadImage("img/win.png");
  restart=loadImage("img/restart.png");
  ship=loadImage("img/ship.png");

  shipX = width / 2 - shipWidth / 2;
  shipY = 0;

  wallColor = color(247, 210, 60);
  wall1X = 100;
  wall2X = 200;
  wall3X = 300;
}

void draw() {
  switch(gameState) {
  case GAME_START:
    if (mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
      && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM) {
      image(startHover, 0, 0);
      if (mousePressed) {
        gameState = GAME_RUN;
      }
    } else {
      image(startNormal, 0, 0);
    }
    break;

  case GAME_RUN:
    image(bg, 0, 0);
    image(ship, shipX, shipY);

    // draw walls
    stroke(wallColor);
    strokeWeight(5);


    line(0, wall1Y, wall1X, wall1Y);
    line(wall1X+wall1HoleWidth, wall1Y, width, wall1Y);

    line(0, wall2Y, wall2X, wall2Y);
    line(wall2X+wall2HoleWidth, wall2Y, width, wall2Y);

    line(0, wall3Y, wall3X, wall3Y);
    line(wall3X+wall3HoleWidth, wall3Y, width, wall3Y);

    wall1X+=wall1Speed;
    wall2X+=wall2Speed;
    wall3X+=wall3Speed;

    if (wall1X+wall1HoleWidth>width || wall1X<0) {
      wall1Speed*=-1;
    }
    if (wall2X+wall2HoleWidth>width || wall2X<0) {
      wall2Speed*=-1;
    }
    if (wall3X+wall3HoleWidth>width || wall3X<0) {
      wall3Speed*=-1;
    }

    if (shipY> winningLineY) {
      gameState = GAME_WIN;
    } else if (shipYwall1Y) {
      
    }

    break;

  case GAME_WIN:
    image(win, 0, 0);
    break;

  case GAME_LOSE:
    image(lose, 0, 0);
    break;
  }
}

void keyPressed() {
  // DO NOT REMOVE THIS PART!!!
  // USED FOR DEBUGGING
  switch (key) {
  case '1':
    gameState = GAME_START;
    break;
  case '2':
    gameState = GAME_RUN;
    break;
  case '3':
    gameState = GAME_WIN;
    break;
  case '4':
    gameState = GAME_LOSE;
    break;
  }
  // Your code start from here
  if (key == CODED) {

    if (keyCode == UP) {
      shipY-=shipSpeed;
    } else if (keyCode == DOWN) {
      shipY+=shipSpeed;
    } else if (keyCode == LEFT) {
      shipX-=shipSpeed;
    } else if (keyCode == RIGHT) {
      shipX+=shipSpeed;
    }
  }
}

void keyReleased() {
}
