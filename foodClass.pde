class Food
{
  int x; 
  int y; 
  int type = 3; 
  Player player;

  Food(int x, int y, Player player)
  {
    this.x = x;
    this.y = y;
    this.player = player;
  }
  void update() {
    println("haha");
  }
}
