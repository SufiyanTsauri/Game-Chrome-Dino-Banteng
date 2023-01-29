public class Player 
{
  private float yPosition;
  private float xPosition;
  private float gravity;
  private float ySpeed;
  private float xSpeed;
  private float radius;
 
  public Player() {
    
    this.yPosition = 450;
    this.xPosition = 100;
    this.gravity = 2;
    this.radius = (playerImage.width/2) - 1;
    this.ySpeed = 0;
    this.xSpeed = 0;
    
  }
  
  public float getX(){
    return this.xPosition;
  }
  
  public float getY(){
    return this.yPosition;
  }
  
  public float getRadius(){
    return this.radius;
  }
  
  public void jump(){
    if (yPosition == bottomPosition){
      ySpeed = -25;
    }
  }
 
  public void display() {
    image(playerImage, this.xPosition - this.radius, this.yPosition - playerImage.height);
  }
  
  public  void move(){
    this.yPosition += this.ySpeed;
    if (this.yPosition != bottomPosition){
      this.ySpeed += this.gravity;
    }
    else {
      this.ySpeed = 0;
    }
    
  }
 
  
}
