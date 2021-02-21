class Enemy {
  int x; 
  int y; 
  int type = 1; 
  Player player;

  Enemy(int x, int y, Player player) {
    this.x = x;
    this.y = y;
    this.player = player;
  }

  void MoveTowardsPlayer() {
    //theese tell me how much space there is between the enemy and the player
    int xDistance = Math.abs(player.x - x);
    int yDistance = Math.abs(player.y - y);

    //can´t get it to work any other way
    double rand = random(0, 100);
    
    //println(rand + " rand"); // hvis du vil vide hvorfor det virker
    if (rand < 10) {//2 = easy, 5 = medium, 10 = hard
      //println(rand + " rand in"); // hvis du vil vide hvorfor det virker
      if (xDistance > yDistance && player.x > x) {
        this.x++;
      } else if (xDistance > yDistance && player.x < x) {
        this.x--;
      } else if (yDistance > xDistance && player.y > y) {
        this.y++;
      } else if (yDistance > xDistance && player.y < y) {
        this.y--;
      }
    }
  }
}
