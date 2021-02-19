class Food {
  int x; 
  int y; 
  int type = 3; 
  Player player;

  Food(int x, int y, Player player) {
    this.x = x;
    this.y = y;
    this.player = player;
  }
  void MoveAwayFromPlayer() {
    //how much distance is ther between the player and food
    int xDistance = Math.abs(player.x - x);
    int yDistance = Math.abs(player.y - y);

    //if the player collides with food, food dissapears and pops up in a random place
    if (this.x == player.x && this.y == player.y) {
      this.x = int(random(0, 24));
      this.y = int(random(0, 24));
    }

    //no idea why this works
    double rand = random(100);

    if (rand < 2) {
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
