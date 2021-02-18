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
    health = 100;
  }


  void takeDamage()
  {
    health --;
  }

  void eat() {
    score++;
  }
}
