//this function is only called when the player is on the same space as an enemy or food
void resolveCollisions() {    
  //this for loop goes through the foods and checks if it was a food that collided with the player
  for (int i = 0; i < foods.size(); i++) {
    if (grid[foods.get(i).x][foods.get(i).y] == grid[player.x][player.y]) {

      //if it was then increase score
      player.eat();
    }
    break;
  }

  //this checks if it was an enemy who collided with the player
  for (int i = 0; i < enemies.size(); i++) {
    if (grid[enemies.get(i).x][enemies.get(i).y] == grid[player.x][player.y]) {

      //if it was decrease health  
      player.takeDamage();

      //checks to see if the game is over(if health = 0)
      isGameOver();
    }
    break;
  }
}
