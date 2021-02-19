
void updateEntities()
{
  //here i use try so that when the inevitable moment when the player, enemies or food tries to go outside the grid
  try {//if any of this fails it is because something is trying to go outside the grid
    //this for loop goes through the foods array
    for (int i = 0; i < foods.size(); i++) {
      //puts the foods type(color) on their location
      grid[foods.get(i).x][foods.get(i).y] = foods.get(i).type;
      //calls a function that calls another function to make the foods move away from the player
      updateFoods();
      //if the player and the food is in the same place
      if (grid[player.x][player.y] == grid[foods.get(i).x][foods.get(i).y]) {
        //call the function that makes the score increse when they touch the player        
        resolveCollisions();
      }
    }

    //i put the player here so the player will appear on top of food and below enemies
    grid[player.x][player.y] = player.type;

    //the for loop below go through the enemies array 
    for (int i = 0; i < enemies.size(); i++) {
      //puts the enemies type(color) on their location
      grid[enemies.get(i).x][enemies.get(i).y] = enemies.get(i).type;
      //calls a function that calls another function to make the enemies move towards the player
      updateEnemies();
      //if an enemy is at the same place as player
      if (grid[player.x][player.y] == grid[enemies.get(i).x][enemies.get(i).y]) {
        //call the function that makes the health decrese when they touch the player
        resolveCollisions();
      }
    }
  }
  //if someone tries to go outside the grid this function catches that error
  catch(ArrayIndexOutOfBoundsException e) {//player is outside the grid
    println("You can´t move that way " + e);
    //if the player goes outside the grid they will stay there until you move it the other way
    if (player.x < 0) { //if the player goes outside the grid
      player.x = 0;
    } else if (player.x > 24) {
      player.x = 24;
    } else if (player.y < 0) {
      player.y = 0;
    } else if (player.y > 24) {
      player.y = 24;
    }

    //if the enemy goes outside the grid
    for (int i = 0; i < enemies.size(); i++) {
      if (enemies.get(i).x < 0) {
        enemies.get(i).x = 0;
      } else if (enemies.get(i).x > 24) {
        enemies.get(i).x = 24;
      } else if (enemies.get(i).y < 0) {
        enemies.get(i).y = 0;
      } else if (enemies.get(i).y > 24) {
        enemies.get(i).y = 24;
      }
      //makes the enemy move towards the player
      updateEnemies();
    }

    //if the enemy goes outside the grid
    for (int i = 0; i < foods.size(); i++) {
      if (foods.get(i).x < 0) {
        foods.get(i).x = 0;
      } else if (foods.get(i).x > 24) {
        foods.get(i).x = 24;
      } else if (foods.get(i).y < 0) {
        foods.get(i).y = 0;
      } else if (foods.get(i).y > 24) {
        foods.get(i).y = 24;
      }
      //makes the food move away from the player
      updateFoods();
    }
  }
}
