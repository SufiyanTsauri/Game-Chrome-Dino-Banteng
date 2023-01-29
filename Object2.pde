public class Obstacle{
  
    private float yPosition;
    private float xPosition;
    private float radius;
  
    public Obstacle(){
      this.yPosition = 450;
      this.xPosition = 1000;
      this.radius = obstacleImage.width/2;
      
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
    
    public void move(){
      this.xPosition -= 5;
    }
    
    public void display(){
      image(obstacleImage, this.xPosition - this.radius, this.yPosition - obstacleImage.height);
    }
  
}
