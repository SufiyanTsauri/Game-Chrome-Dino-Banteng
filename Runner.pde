PImage playerImage; //<>//
PImage obstacleImage;
PImage bgImage;
 
Player player;
int numObstacles = 1;
float bottomPosition = 450;
int frameWidth = 640;
int frameHeight = 360;
int time;
float spacing = 0;
float score1;
ArrayList<Obstacle> obstacles;
boolean isCollided = false;
int score2 = 0;

PFont f;
//untuk import asset
void setup()
{
  playerImage = loadImage("banteng.png");
  obstacleImage = loadImage("money.png");
  //bgImage = loadImage("subway.gif");
  //bgImage = loadImage("city.png");
  bgImage = loadImage("citypixel.jpg");

  player = new Player();
  obstacles = new ArrayList<Obstacle>();
  
  background(bgImage);
  size(1000, 514);
  fill(255, 204);
  frameRate(60);
  f = createFont("Arial",16,true);
}
 
void draw()
{
  background(bgImage);
  stroke(0);
  line(0, bottomPosition, 1000, 450); // garis jalanan 
  
  score1 = millis()/100; //skor berdasarkan waktu
  textSize(24);
  fill(0);
  text("Time Score: " + score1, 10, 30);
  
  player.display(); 
  player.move();
  
  int interval = int(random(500, 6000)); //mengeluarkan object secara random
  if (millis() - time > interval) 
  {
    obstacles.add(new Obstacle());
    time = millis();
  }
  
  for (Obstacle i : obstacles){
    i.display();
    i.move();
    if (i.xPosition == 0){
      score2++;
      if (i.xPosition < -100){ // menghapus halangan yang tidak digunakan
       obstacles.remove(i); 
      }
    }
    if (isCollided(player, i)){
      String x = "Game Over";
      fill(0);
      textSize(32);
      text(x, 300, 100);
      noLoop();
    }
    
  } 
  String y = String.valueOf(score2);
  fill(0);
  textSize(24);
  text("Blocks Passed: " + y, 410, 30);
}

boolean isCollided(Player player, Obstacle i){ // mengcek apakah player bertabrakan
  
  // mengcek apakah tepi atas rintangan tumpang tindih dengan rentang koordinat y pemain DAN tepi kiri rintangan tumpang tindih dengan rentang koordinat x pemain
  if ((i.getY()-obstacleImage.height <= player.getY()-10) && (i.getX() <= player.getX()+playerImage.width) && (i.getX() >= player.getX())) {
    return true;
  } else if ((i.getY()-obstacleImage.height <= player.getY()-10) && (i.getX()+obstacleImage.width <= player.getX()+playerImage.width) && (i.getX()+obstacleImage.width >= player.getX())) {
    // mengcek apakah tepi atas rintangan tumpang tindih dengan rentang koordinat y pemain DAN tepi kanan rintangan tumpang tindih dengan rentang koordinat x pemain
      return true;
  }
    
  return false;
}

void keyPressed(){  
  if (key == ' '){
    player.jump(); // melompat apabila spasi di klik
  }
  else if (key == 'q'){ //klik "q" untuk keluar game //<>//
    String s = "Game Quit";
    fill(0);
    textSize(32);
    text(s, 320, 180);
    noLoop();
  }
  
}
