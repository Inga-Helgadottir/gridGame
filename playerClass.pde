class Player
{
  int x; 
  int y; 
  int type = 2; 
  int health; 
  int score;

  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    health = 1000;//if there is time later - change how much is taken from the score on inpact
  }


  void takeDamage()
  {
    health = health - 1;//player keeps loosing health as long as they are in the same place
  }

  void eat() {
    score++;
    noLoop();
  }
}
