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
    void MoveAwayFromPlayer()
  {
    int xDistance = Math.abs(player.x - x);
    int yDistance = Math.abs(player.y - y);

    // random chance (~25% chance) for at enemy flytter sig i en tilfældig retning. 
    double d = random(100);
    if (d < 1) {
      if (xDistance > yDistance && player.x > x) {
        this.x--;
      } else if (xDistance > yDistance && player.x < x) {
        this.x++;
      } else if (yDistance > xDistance && player.y > y) {
        this.y--;
      } else if (yDistance > xDistance && player.y < y) {
        this.y++;
      }
    }
  }
}
